import 'package:flutter/material.dart';

import '../../../utils/assets_constants.dart';

class WidgetLogo extends StatelessWidget {
  const WidgetLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: SizedBox(
          child: Image.asset(
        ImagesConstants.logo,
        width: 130,
      )),
    );
  }
}
