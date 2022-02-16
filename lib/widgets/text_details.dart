import 'package:flutter/material.dart';

class TextDetails extends StatelessWidget {
  final String? title;

  final TextStyle? style;

  const TextDetails({
    Key? key,
    this.style,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 10,
      ),
      child: _setTextStyle(title),
    );
  }

  _setTextStyle(text) {
    if (style != null) {
      return Text(text, style: style);
    }
    return Text(text);
  }
}
