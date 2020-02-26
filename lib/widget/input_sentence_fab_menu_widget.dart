import 'package:flutter/material.dart';

class InputSentenceFabMenuWidget extends StatefulWidget {

  final FocusNode focusNode;

  InputSentenceFabMenuWidget({
    Key key,
    @required this.focusNode
  }): super(key: key);

  @override
  State<StatefulWidget> createState() => _InputSentenceFabMenuWidgetState();
}

class _InputSentenceFabMenuWidgetState extends State<InputSentenceFabMenuWidget> {

  bool _isEditing = false;

  void _onUpdateFocusNode() {
    setState(() {
      _isEditing = widget.focusNode.hasFocus;
    });
  }

  void _onPressCancelButton() {
    widget.focusNode.unfocus();
  }

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(() => _onUpdateFocusNode());
  }

  @override
  void dispose() {
    widget.focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _isEditing ? 1 : 0, 
      duration: Duration(milliseconds: 200),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          // Cancel button
          FloatingActionButton.extended(
            onPressed: () => _onPressCancelButton(), 
            label: Text('キャンセル'),
          ),
          // Spacer
          SizedBox(width: 8),
          // Translate button
          FloatingActionButton.extended(
            onPressed: () {},
            label: Text('変換する'),
            icon: Icon(Icons.translate),
          ),
        ]
      ),
    );
  }
}