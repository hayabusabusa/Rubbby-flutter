import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import 'package:rubbby/app_routes.dart';
import 'package:rubbby/model/model.dart';
import 'package:rubbby/repository/repository.dart';
import 'package:rubbby/bloc/blocs.dart';
import 'package:rubbby/screen/screen.dart';

void main() {
  // NOTE: API
  final apiClient = HiraganaTranslationApiClient();
  final hiraganaTranslationRepository = HiraganaTranslationRepository(apiClient: apiClient);
  // NOTE: Hive
  // NOTE: カスタムのオブジェクトはここでAdapterを登録しなければならない.
  //       保存したいオブジェクトが増えるほどここは増えていくので、大規模なものには向かないかもしれない.
  Hive.registerAdapter(HistoryAdapter());
  final historyRepository = HistoryRepositoryImpl();

  runApp(RubbbyApp(hiraganaTranslationRepository: hiraganaTranslationRepository, historyRepository: historyRepository,));
}

class RubbbyApp extends StatelessWidget {
  final HiraganaTranslationRepository hiraganaTranslationRepository;
  final HistoryRepository historyRepository;

  RubbbyApp({
    Key key,
    @required this.hiraganaTranslationRepository,
    @required this.historyRepository,
  }): assert(hiraganaTranslationRepository != null,
             historyRepository != null), 
      super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // NOTE: InputSentece Bloc
        BlocProvider<InputSentenceBloc>(
          create: (context) => InputSentenceBloc(hiraganaTranslationRepository: hiraganaTranslationRepository),
        ),
        // NOTE: History Bloc
        BlocProvider<HistoryBloc>(
          create: (context) => HistoryBloc(historyRepository: historyRepository),
        ),
        // NOTE: Result Bloc
        BlocProvider<ResultBloc>(
          create: (context) => ResultBloc(historyRepository: historyRepository),
        ),
      ], 
      child: MaterialApp(
        initialRoute: AppRoutes.inputSentence,
        routes: {
          AppRoutes.inputSentence: (context) => InputSentenceScreen(),
          AppRoutes.history: (context) => HistoryScreen(),
        },
      ),
    );
  }
}