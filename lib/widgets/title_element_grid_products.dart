import 'package:flutter/material.dart';

class TitleElementGridProducts extends StatelessWidget {
  final String? title;

  const TitleElementGridProducts({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      child: Text(
        '$title',
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }
}
