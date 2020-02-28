import 'package:flutter/material.dart';

import 'package:rubbby/app_routes.dart';
import 'package:rubbby/repository/repository.dart';
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
    return MaterialApp(
      initialRoute: AppRoutes.inputSentence,
      routes: {
        AppRoutes.inputSentence: (context) => InputSentenceScreen(repository: repository,),
      },
    );
  }
}