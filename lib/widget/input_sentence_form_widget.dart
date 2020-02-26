import 'package:flutter/material.dart';

import 'package:rubbby/app_routes.dart';
import 'package:rubbby/model/model.dart';
import 'package:rubbby/util/util.dart';

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

  void _onPressedCloseButton() {
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

  void _onPressedTranslateButton() {
    Navigator.of(context).pushNamed(AppRoutes.result);
  }

  DropdownButton _buildDropDownButtons() {
    return DropdownButton<OutputType>(
      items: [
        DropdownMenuItem(
          value: OutputType.hiragana,
          child: Text(Strings.hiragana),
        ),
        DropdownMenuItem(
          value: OutputType.katakana,
          child: Text(Strings.katakana),
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
                Text(Strings.inputSentenceTitleText),
                SizedBox(width: 8),
                Icon(Icons.chevron_right),
                SizedBox(width: 8),
                _buildDropDownButtons(),
                Expanded(child: SizedBox()),
                IconButton(
                  icon: Icon(Icons.cancel, color: Colors.grey,),
                   onPressed: () => _onPressedCloseButton(),
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
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold,),
              decoration: InputDecoration(
                hintText: Strings.inputSentenceTextFieldHintText,
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
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      child: Text(
                        Strings.translateButtonTitle,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    color: Colors.blue,
                    shape: StadiumBorder(),
                    onPressed: () => _onPressedTranslateButton(),
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