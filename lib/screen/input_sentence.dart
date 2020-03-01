import 'package:flutter/material.dart';

import 'package:rubbby/widget/widget.dart';
import 'package:rubbby/util/util.dart';

class InputSentenceScreen extends StatelessWidget {
  final FocusNode _focusNode = FocusNode(); // 共通のFocusNode

  InputSentenceScreen({
    Key key,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.translateButtonTitle),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
          children: <Widget>[
            InputSentenceFormWidget(focusNode: _focusNode),
            SizedBox(height: 16,),
            InputSentenceDescWidget()
          ],
        ),
      ),
      floatingActionButton: InputSentenceFabMenuWidget(focusNode: _focusNode),
    );
  }
}