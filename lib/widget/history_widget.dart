import 'package:flutter/material.dart';

import 'package:rubbby/model/model.dart';

class HistoryWidget extends StatelessWidget {
  final History history;

  const HistoryWidget(this.history);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: <Widget>[
            // Converted Text
            Text(
              history.convertedText,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            // Divider
            Divider(color: Colors.grey),
            // Original Text
            Text(
              history.originalText,
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}