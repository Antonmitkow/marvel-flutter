import 'package:flutter/material.dart';
import 'package:flutter_labs/screens/main_screen/widgets/widget_list_hero.dart';
import 'package:flutter_labs/screens/main_screen/widgets/widget_logo.dart';
import 'package:flutter_labs/screens/main_screen/widgets/widget_text.dart';
import 'package:flutter_labs/utils/colors_constants.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            WidgetLogo(),
            WidgetTextMainScreen(),
            Expanded(child: WidgetListHero())
          ],
        ),
      ),
      backgroundColor: ConstantsColors.backgroundColor,
    );
  }
}
