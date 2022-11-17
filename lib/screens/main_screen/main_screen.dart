import 'package:flutter/material.dart';
import 'package:flutter_labs/models/hero_marvel.dart';
import 'package:flutter_labs/screens/main_screen/view_model/view_model.dart';
import 'package:flutter_labs/screens/main_screen/widgets/widget_list_hero.dart';
import 'package:flutter_labs/screens/main_screen/widgets/widget_logo.dart';
import 'package:flutter_labs/screens/main_screen/widgets/widget_text.dart';
import 'package:flutter_labs/theme/colors_constants.dart';
import 'package:flutter_labs/theme/ui/error_widget.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  final List<HeroMarvel> listHero;
  const MainScreen({Key? key, required this.listHero}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final loading =
        context.select((ViewModel value) => value.state.isLoadingHeroList);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const WidgetLogo(),
            const WidgetTextMainScreen(),
            loading
                ? Expanded(
                    child: widget.listHero != []
                        ? WidgetListHero(
                            listHero: widget.listHero,
                          )
                        : const NetworkErrorWidget(),
                  )
                : const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
          ],
        ),
      ),
      backgroundColor: ConstantsColors.backgroundColor,
    );
  }
}
