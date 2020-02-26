import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('変換結果'),
      ),
      body: Center(
        child: Text('Result'),
      )
    );
  }
}