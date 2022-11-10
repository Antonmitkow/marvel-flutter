import 'package:flutter/material.dart';

import '../../../theme/colors_constants.dart';

class WidgetTextMainScreen extends StatelessWidget {
  const WidgetTextMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Choose your hero',
      style: TextStyle(
          color: ConstantsColors.defaultTextColor,
          fontSize: 34,
          fontWeight: FontWeight.w700),
    );
  }
}
