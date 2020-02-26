import 'package:flutter/material.dart';

import 'package:rubbby/widget/widget.dart';

class InputSentenceScreen extends StatelessWidget {
  final FocusNode _focusNode = FocusNode(); // 共通のFocusNode

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('変換する'),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          children: <Widget>[
            InputSentenceFormWidget(focusNode: _focusNode,),
            SizedBox(height: 16,),
            InputSentenceDescWidget()
          ],
        ),
      ),
      floatingActionButton: InputSentenceFabMenuWidget(focusNode: _focusNode,),
    );
  }
}