import 'package:flutter/material.dart';

class WidgetHeroName extends StatelessWidget {
  final String name;
  const WidgetHeroName({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: const TextStyle(
          fontSize: 34, color: Colors.white, fontWeight: FontWeight.w700),
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }
}
