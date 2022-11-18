import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../models/hero_marvel.dart';

class WidgetHero extends StatelessWidget {
  final HeroMarvel hero;
  const WidgetHero({Key? key, required this.hero}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: 'heroMarvel${hero.id}',
        child: CachedNetworkImage(
          imageUrl: '${hero.image.path}.${hero.image.extension}',
          fit: BoxFit.cover,
          height: double.infinity,
        ));
  }
}
