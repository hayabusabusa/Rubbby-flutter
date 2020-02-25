import 'package:flutter/material.dart';

class InputSentenceDescWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InputSentenceDescWidgetState();
}

class _InputSentenceDescWidgetState extends State<InputSentenceDescWidget> {

  bool _isExpanded = false;

  void _onPressedButton() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: _isExpanded ? Colors.red : Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Title and button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text('Title'),
              Expanded(child: SizedBox()),
              FlatButton(
                onPressed: () => _onPressedButton(),
                child: Text(_isExpanded ? '表示する': '閉じる')
              )
            ]
          ),
          // Text view
          _isExpanded ? SizedBox() : Text('説明のところ'),
        ]
      )
    );
  }
}