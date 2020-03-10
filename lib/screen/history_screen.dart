import 'package:flutter/material.dart';

import 'package:rubbby/widget/widget.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('変換履歴'),
      ),
      body: HistoryListWidget(),
    );
  }
}