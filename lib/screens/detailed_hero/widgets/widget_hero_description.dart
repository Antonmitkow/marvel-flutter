import 'package:flutter/material.dart';

class WidgetHeroDescription extends StatelessWidget {
  final dynamic description;
  const WidgetHeroDescription({Key? key, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      description != '' ? description : 'Нет описания',
      style: const TextStyle(
          fontSize: 22, color: Colors.white, fontWeight: FontWeight.w700),
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }
}
