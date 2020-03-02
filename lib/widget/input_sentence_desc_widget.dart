import 'package:flutter/material.dart';

import 'package:rubbby/util/util.dart';

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
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.all(Radius.circular(8))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Title and button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                Strings.usageDescriptionTitle,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Expanded(child: SizedBox()),
              FlatButton(
                onPressed: _onPressedButton,
                child: Text(
                  _isExpanded ? Strings.usageDescriptionClose : Strings.usageDescriptionOpen,
                  style: TextStyle(color: Colors.white),
                )
              )
            ]
          ),
          // Text view
          _isExpanded 
            ? Text(
              Strings.usageDescriptionContent,
              style: TextStyle(color: Colors.white, fontSize: 14),
            ) 
            : SizedBox(),
        ]
      )
    );
  }
}