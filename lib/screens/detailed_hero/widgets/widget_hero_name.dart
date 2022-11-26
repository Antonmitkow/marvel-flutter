import 'package:flutter/material.dart';

class WidgetHeroName extends StatelessWidget {
  final String name;
  const WidgetHeroName({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: Theme.of(context).textTheme.headline1,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }
}
