import 'package:flutter/material.dart';

import 'package:rubbby/widget/widget.dart';

class InputSentenceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('変換する'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            InputSentenceDescWidget(),
            InputSentenceDescWidget()
          ],
        ),
      ),
    );
  }
}