import 'package:flutter/material.dart';

import 'package:rubbby/model/model.dart';
import 'package:rubbby/widget/widget.dart';

class ResultScreen extends StatelessWidget {
  final String originalText;
  final Translation translation;

  ResultScreen({
    Key key,
    @required this.originalText,
    @required this.translation,
  }): assert(originalText != null, translation != null), 
      super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('変換結果'),
      ),
      body: Stack(
        children: <Widget>[
          // List
          ListView(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
            children: <Widget>[
              ResultOutputWidget(convertedText: translation.converted, originalText: originalText)
            ],
          ),
          // Button
          ResultBottomWidget(),
        ],
      ),
    );
  }
}