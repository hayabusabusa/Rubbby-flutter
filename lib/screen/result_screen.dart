import 'package:flutter/material.dart';

import 'package:rubbby/widget/widget.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('変換結果'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
        children: <Widget>[
          ResultOutputWidget(convertedText: 'Converted', originalText: 'Oritinal')
        ],
      ),
    );
  }
}