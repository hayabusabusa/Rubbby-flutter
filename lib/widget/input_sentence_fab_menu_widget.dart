import 'package:flutter/material.dart';

import 'package:rubbby/util/util.dart';

// MARK: - Widget

class InputSentenceFabMenuWidget extends StatefulWidget {
  final FocusNode focusNode;

  InputSentenceFabMenuWidget({
    Key key,
    @required this.focusNode,
  }): assert(focusNode != null),
      super(key: key);

  @override
  State<StatefulWidget> createState() => _InputSentenceFabMenuWidgetState();
}

// MARK: - State

class _InputSentenceFabMenuWidgetState extends State<InputSentenceFabMenuWidget> {

  bool _isEditing = false;

  // MARK: Private method

  void _onUpdateFocusNode() {
    setState(() {
      _isEditing = widget.focusNode.hasFocus;
    });
  }

  void _onPressedTranslateButton() {
    widget.focusNode.unfocus();
  }

  void _onPressCancelButton() {
    widget.focusNode.unfocus();
  }

  // MARK: Lifecycle

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
          // NOTE: 複数のFABがある場合はデフォルトで設定されているHeroタグが被るので、
          //       ユニークなタグを設定してあげる必要がある.
          FloatingActionButton.extended(
            heroTag: 'InputSentenceCancel',
            onPressed: () => _onPressCancelButton(), 
            label: Text(Strings.closeButtonTitle),
            icon: Icon(Icons.close),
          ),
          // Spacer
          SizedBox(width: 8),
          // Translate button
          FloatingActionButton.extended(
            heroTag: 'InputSentenceTranslate',
            onPressed: () => _onPressedTranslateButton(),
            label: Text(Strings.translateButtonTitle),
            icon: Icon(Icons.translate),
          ),
        ]
      ),
    );
  }
}