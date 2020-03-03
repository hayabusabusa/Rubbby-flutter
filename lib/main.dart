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
  final repository = HiraganaTranslationRepository(apiClient: apiClient);
  // NOTE: Hive
  // NOTE: カスタムのオブジェクトはここでAdapterを登録しなければならない.
  //       保存したいオブジェクトが増えるほどここは増えていくので、大規模なものには向かないかもしれない.
  Hive.registerAdapter(HistoryAdapter());

  runApp(RubbbyApp(repository: repository,));
}

class RubbbyApp extends StatelessWidget {
  final HiraganaTranslationRepository repository;

  RubbbyApp({
    Key key,
    @required this.repository,
  }): assert(repository != null), 
      super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) { return InputSentenceBloc(hiraganaTranslationRepository: repository); },
      child: MaterialApp(
        initialRoute: AppRoutes.inputSentence,
        routes: {
          AppRoutes.inputSentence: (context) => InputSentenceScreen(),
        },
      ),
    );
  }
}