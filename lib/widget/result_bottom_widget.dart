import 'package:flutter/material.dart';

class ResultBottomWidget extends StatelessWidget {

  // MARK: Private method

  void _onPressedBackButton(BuildContext context) {
    Navigator.of(context).pop();
  }

  // MARK: Lifecycle

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Separator
            SizedBox(height: 1, child: Container(color: Colors.grey[300]),),
            // Sapcer
            SizedBox(height: 16,),
            // Button
            Row(
              children: <Widget>[
                SizedBox(width: 24,), // Spacer
                Expanded(child: RaisedButton(
                    onPressed: () => _onPressedBackButton(context),
                    shape: StadiumBorder(),
                    color: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      '他の文章を変換する',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(width: 24,), // Spacer
              ],
            ),
            // Sapcer
            SizedBox(height: 28,), // Spacer
          ],
        ),
      ),
    );
  }
}