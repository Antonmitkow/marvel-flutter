import 'package:flutter/material.dart';

class WidgetTextMainScreen extends StatelessWidget {
  const WidgetTextMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Choose your hero',
      style: Theme.of(context).textTheme.headline1,
    );
  }
}
