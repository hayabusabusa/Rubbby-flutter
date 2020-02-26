import 'package:flutter/material.dart';

import 'package:rubbby/model/model.dart';

// MARK: - Widget

class InputSentenceFormWidget extends StatefulWidget {

  final FocusNode focusNode;

  InputSentenceFormWidget({
    Key key,
    @required this.focusNode,
  }): super(key: key);

  @override
  State<StatefulWidget> createState() => _InputSentenceFormWidgetState();
}

// MARK: - State

class _InputSentenceFormWidgetState extends State<InputSentenceFormWidget> {
  TextEditingController _textEditingController;

  OutputType _selectedValue = OutputType.hiragana;
  bool _isEditing = false;
  
  // MARK: Private method

  void _onPressCloseButton() {
    _textEditingController.text = '';
  }

  void _onUpdateFocusNode() {
    setState(() {
      _isEditing = widget.focusNode.hasFocus;
    });
  }

  void _onChangedDropDownButton(OutputType outputType) {
    setState(() {
      _selectedValue = outputType;
    });
  }

  DropdownButton _buildDropDownButtons() {
    return DropdownButton<OutputType>(
      items: [
        DropdownMenuItem(
          value: OutputType.hiragana,
          child: Text('ひらがな'),
        ),
        DropdownMenuItem(
          value: OutputType.katakana,
          child: Text('カタカナ'),
        )
      ],
      value: _selectedValue,
      onChanged: (value) => _onChangedDropDownButton(value),
    );
  }

  // MARK: Lifecycle

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(() => _onUpdateFocusNode());
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
                _buildDropDownButtons(),
                Expanded(child: SizedBox()),
                IconButton(
                  icon: Icon(Icons.close),
                   onPressed: () => _onPressCloseButton(),
                )
              ]
            ),
            // Divider
            Divider(color: Colors.grey,),
            // TextField
            TextField(
              maxLines: null,
              focusNode: widget.focusNode,
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
                AnimatedOpacity(
                  opacity: _isEditing ? 0 : 1, 
                  duration: Duration(milliseconds: 200),
                  child: RaisedButton(
                    child: Text(
                      '変換する',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.blue,
                    shape: StadiumBorder(),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}