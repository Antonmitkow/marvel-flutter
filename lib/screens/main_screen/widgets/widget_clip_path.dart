import 'package:flutter/material.dart';
import 'package:flutter_labs/screens/main_screen/widgets/clipper.dart';

import '../../../theme/colors_constants.dart';

class WidgetClipPath extends StatelessWidget {
  final int index;
  const WidgetClipPath({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: Clipper(),
      child: Container(
        color: getBackgroundColor(index),
      ),
    );
  }

  Color getBackgroundColor(int id) {
    Color currentColor;
    switch (id) {
      case 1:
      case 7:
      case 14:
        currentColor = ConstantsColors.ironManColor;
        break;

      case 2:
      case 8:
      case 15:
        currentColor = ConstantsColors.captainAmericaColor;
        break;
      case 3:
      case 9:
      case 16:
        currentColor = ConstantsColors.spidermanColor;
        break;

      case 4:
      case 10:
      case 17:
        currentColor = ConstantsColors.doctorStrangeColor;
        break;

      case 5:
      case 11:
      case 18:
        currentColor = ConstantsColors.thorColor;
        break;
      case 6:
      case 12:
      case 19:
        currentColor = ConstantsColors.thanosColor;
        break;
      case 0:
      case 13:
      case 20:
      default:
        currentColor = ConstantsColors.deadpoolColor;
    }
    return currentColor;
  }
}
