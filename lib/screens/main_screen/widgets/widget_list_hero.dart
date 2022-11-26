import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_labs/screens/main_screen/widgets/widget_card.dart';
import 'package:flutter_labs/screens/main_screen/widgets/widget_clip_path.dart';
import 'package:provider/provider.dart';

import '../../../models/hero_marvel.dart';
import '../../../theme/colors_constants.dart';
import '../../detailed_hero/detailed_hero_screen.dart';
import '../view_model/view_model.dart';

class WidgetListHero extends StatefulWidget {
  final List<HeroMarvel> listHero;
  const WidgetListHero({Key? key, required this.listHero}) : super(key: key);

  @override
  State<WidgetListHero> createState() => _WidgetListHeroState();
}

class _WidgetListHeroState extends State<WidgetListHero> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WidgetClipPath(index: _currentIndex),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 35),
          child: PageView.builder(
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            controller: PageController(viewportFraction: 0.77),
            itemBuilder: (context, index) {
              return TweenAnimationBuilder(
                duration: const Duration(milliseconds: 250),
                tween: Tween(
                  begin: _currentIndex == index ? 1.0 : 0.8,
                  end: _currentIndex == index ? 1.0 : 0.9,
                ),
                builder: (BuildContext context, num value, Widget? child) {
                  return Transform.scale(
                    child: child,
                    scale: value.toDouble(),
                  );
                },
                child: Padding(
                  padding: _currentIndex == index
                      ? const EdgeInsets.symmetric(horizontal: 5)
                      : const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: () {
                      final model = context.read<ViewModel>();
                      model.getDescriptionById(widget.listHero[index].id);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (builder) => DetailedHeroScreen(
                                hero: widget.listHero[index],
                              )));
                    },
                    child: CachedNetworkImage(
                      imageUrl: widget.listHero[index].url,
                      imageBuilder: (context, imageProvider) {
                        return WidgetHeroCard(
                          index: index,
                          name: widget.listHero[index].name,
                          imageProvider: imageProvider,
                        );
                      },
                      placeholder: (context, url) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: ConstantsColors.defaultColor,
                        ),
                        child: const Center(child: CircularProgressIndicator()),
                      ),
                      errorWidget: (context, url, error) => const Center(
                        child: Text('Ошибка загрузки'),
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount: widget.listHero.length,
          ),
        ),
      ],
    );
  }
}
