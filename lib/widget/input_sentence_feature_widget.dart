import 'package:flutter/material.dart';

class InputSentenceFeatureWidget extends StatelessWidget {
  final String title;
  final Function onPressed;

  InputSentenceFeatureWidget({
    Key key,
    @required this.title,
    @required this.onPressed
  }): assert(title != null,
             onPressed != null),
      super(key: key);

  // MARK: Private

  // MARK: Override

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      color: Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 4),
        child: Row(
          children: <Widget>[
            // Icon
            Icon(
              Icons.history,
              color: Colors.white,
            ),
            // Spacer
            SizedBox(width: 8,),
            // Text
            Text(
              title,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}