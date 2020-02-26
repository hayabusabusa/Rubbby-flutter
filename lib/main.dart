import 'package:flutter/material.dart';

import 'package:rubbby/app_routes.dart';
import 'package:rubbby/screen/screen.dart';

void main() {
  runApp(RubbbyApp());
}

class RubbbyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.inputSentence,
      routes: {
        AppRoutes.inputSentence: (context) => InputSentenceScreen()
      },
    );
  }
}