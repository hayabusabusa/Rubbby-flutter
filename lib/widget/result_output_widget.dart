import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ResultOutputWidget extends StatelessWidget {
  final String convertedText;
  final String originalText;

  ResultOutputWidget({
    Key key,
    @required this.convertedText,
    @required this.originalText
  }): super(key: key);

  // MARK: Private method

  Future<void> _onPressedCopyButton(BuildContext context) async {
    final data = ClipboardData(text: convertedText);
    await Clipboard.setData(data);
    Scaffold.of(context).showSnackBar(SnackBar(content: Text('コピーしました。')));
  }

  // MARK: Lifecycle

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Title
            Row(
              children: <Widget>[
                Text('変換結果'),
                Expanded(child: SizedBox()),
                IconButton(
                  icon: Icon(Icons.content_copy), 
                  onPressed: () => _onPressedCopyButton(context),
                )
              ],
            ),
            // Divider
            Divider(color: Colors.grey),
            // Converted text 
            Text(
              convertedText,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            // Spacer
            SizedBox(height: 8,),
            // Original text
            Text(
              originalText,
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            // Spacer
            SizedBox(height: 8,)
          ],
        ),
      ),
    );
  }
}