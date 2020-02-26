import 'package:flutter/material.dart';

class InputSentenceFormWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InputSentenceFormWidgetState();
}

class _InputSentenceFormWidgetState extends State<InputSentenceFormWidget> {
  FocusNode _focusNode;
  TextEditingController _textEditingController;

  void _onTapCloseButton(BuildContext context) {
    _focusNode.unfocus();
  }

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() => print('focusNode updated: hasFocus: ${_focusNode.hasFocus}'));
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            // Title
            Row(
              children: <Widget>[
                Text('漢字の入った文章'),
                SizedBox(width: 8),
                Icon(Icons.chevron_right),
                SizedBox(width: 8),
                Text('ひらがな'),
                Expanded(child: SizedBox()),
                IconButton(
                  icon: Icon(Icons.close),
                   onPressed: () => _onTapCloseButton(context),
                )
              ]
            ),
            // Divider
            Divider(color: Colors.grey,),
            // TextField
            TextField(
              maxLines: null,
              focusNode: _focusNode,
              keyboardType: TextInputType.multiline,
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: '変換したいテキストを入力',
                border: InputBorder.none,
              ),
            ),
            // Translate button
            Row(
              children: <Widget>[
                Expanded(child: SizedBox()),
                RaisedButton(
                  child: Text('変換する'),
                  onPressed: () {},
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}