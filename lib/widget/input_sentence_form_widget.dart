import 'package:flutter/material.dart';

class InputSentenceFormWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InputSentenceFormWidgetState();
}

class _InputSentenceFormWidgetState extends State<InputSentenceFormWidget> {
  TextEditingController _textEditingController = TextEditingController();

  void _onTapCloseButton(BuildContext context) {
    FocusScope.of(context).unfocus();
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
            // TextField and translate button
            TextField(
              maxLines: null,
              keyboardType: TextInputType.multiline,
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: '変換したいテキストを入力',
                border: InputBorder.none,
              ),
            ),
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