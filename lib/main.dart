import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rubbby/app_routes.dart';
import 'package:rubbby/repository/repository.dart';
import 'package:rubbby/bloc/blocs.dart';
import 'package:rubbby/screen/screen.dart';

void main() {
  final apiClient = HiraganaTranslationApiClient();
  final repository = HiraganaTranslationRepository(apiClient: apiClient);

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