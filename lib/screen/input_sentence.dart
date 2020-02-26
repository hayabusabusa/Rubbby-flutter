import 'package:flutter/material.dart';

import 'package:rubbby/repository/repository.dart';
import 'package:rubbby/widget/widget.dart';
import 'package:rubbby/util/util.dart';

class InputSentenceScreen extends StatelessWidget {
  final FocusNode _focusNode = FocusNode(); // 共通のFocusNode
  final HiraganaTranslationRepository repository;

  InputSentenceScreen({
    Key key,
    @required this.repository,
  }): assert(repository != null),
      super(key: key);

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
            // NOTE: デフォルトだと依存関係を引数で渡すしかない
            InputSentenceFormWidget(focusNode: _focusNode,),
            SizedBox(height: 16,),
            InputSentenceDescWidget()
          ],
        ),
      ),
      // NOTE: デフォルトだと依存関係を引数で渡すしかない
      floatingActionButton: InputSentenceFabMenuWidget(focusNode: _focusNode,),
    );
  }
}