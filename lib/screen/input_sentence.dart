import 'package:flutter/material.dart';

import 'package:rubbby/app_routes.dart';
import 'package:rubbby/widget/widget.dart';
import 'package:rubbby/util/util.dart';

class InputSentenceScreen extends StatelessWidget {
  final FocusNode _focusNode = FocusNode(); // 共通のFocusNode

  // MARK: Private

  void _onPressedHistory(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoutes.history);
  }

  // MARK: Override

  InputSentenceScreen({
    Key key,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.translateButtonTitle),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
        children: <Widget>[
          // Form
          InputSentenceFormWidget(focusNode: _focusNode),
          // Spacer
          SizedBox(height: 12,),
          // To history
          InputSentenceFeatureWidget(
            title: '変換履歴を表示する', 
            onPressed: () => _onPressedHistory(context),
          ),
          // Spacer
          SizedBox(height: 12,),
          // Description
          InputSentenceDescWidget()
        ],
      ),
      floatingActionButton: InputSentenceFabMenuWidget(focusNode: _focusNode),
    );
  }
}