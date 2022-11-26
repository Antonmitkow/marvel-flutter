import 'package:flutter/material.dart';

class WidgetHeroDescription extends StatelessWidget {
  final dynamic description;
  const WidgetHeroDescription({Key? key, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: Theme.of(context).textTheme.headline4,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }
}
