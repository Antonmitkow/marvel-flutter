import 'package:flutter/material.dart';
import 'package:flutter_labs/models/hero_marvel.dart';
import 'package:flutter_labs/screens/detailed_hero/widgets/widget_hero.dart';
import 'package:flutter_labs/screens/detailed_hero/widgets/widget_hero_description.dart';
import 'package:flutter_labs/screens/detailed_hero/widgets/widget_hero_name.dart';
import 'package:provider/provider.dart';

import '../main_screen/view_model/view_model.dart';

class DetailedHeroScreen extends StatelessWidget {
  final HeroMarvel hero;
  const DetailedHeroScreen({Key? key, required this.hero}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loading =
        context.select((ViewModel value) => value.state.isLoadingDescription);
    final model = context.watch<ViewModel>();
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Stack(
                children: [
                  WidgetHero(
                    hero: hero,
                  ),
                  Positioned(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        WidgetHeroName(
                          name: hero.name,
                        ),
                        const SizedBox(height: 10),
                        !loading
                            ? WidgetHeroDescription(
                                description:
                                    model.heroDescription.first.description)
                            : const CircularProgressIndicator(),
                      ],
                    ),
                    left: 20,
                    bottom: 30,
                    right: 1,
                  ),
                ],
              ),
            ),
            Positioned(
              child: BackButton(
                color: Colors.white,
                onPressed: () => {
                  model.deleteDescription,
                  Navigator.pop(context),
                },
              ),
              left: 10,
              top: 10,
            ),
          ],
        ),
      ),
    );
  }
}
