import 'package:flutter/material.dart';

import 'package:rubbby/widget/widget.dart';

class InputSentenceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('変換する'),
      ),
      floatingActionButton: FloatingActionButton(onPressed: null),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          children: <Widget>[
            InputSentenceFormWidget(),
            SizedBox(height: 16,),
            InputSentenceDescWidget()
          ],
        ),
      ),
    );
  }
}