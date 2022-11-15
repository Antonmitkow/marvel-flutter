import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_labs/screens/main_screen/widgets/clipper.dart';
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

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: Clipper(),
          child: Container(
            color: getBackgroundColor(_currentIndex),
          ),
        ),
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
                      imageUrl:
                          '${widget.listHero[index].image.path}.${widget.listHero[index].image.extension}',
                      imageBuilder: (context, imageProvider) {
                        return Card(
                          shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          child: Hero(
                            tag: 'heroMarvel$index',
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover)),
                              child: DefaultTextStyle(
                                  style: const TextStyle(
                                      color: ConstantsColors.defaultTextColor,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        child: Text(
                                          widget.listHero[index].name,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                        left: 30,
                                        bottom: 35,
                                      )
                                    ],
                                  )),
                            ),
                          ),
                        );
                      },
                      placeholder: (context, url) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: ConstantsColors.defaultTextColor,
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
