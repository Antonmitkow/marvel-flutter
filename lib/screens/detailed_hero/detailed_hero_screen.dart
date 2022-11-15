import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_labs/models/hero_marvel.dart';
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
                  Hero(
                      tag: 'heroMarvel${hero.id}',
                      child: CachedNetworkImage(
                        imageUrl: '${hero.image.path}.${hero.image.extension}',
                        fit: BoxFit.cover,
                        height: double.infinity,
                      )),
                  Positioned(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          hero.name,
                          style: const TextStyle(
                              fontSize: 34,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        const SizedBox(height: 10),
                        !loading
                            ? Text(
                                model.heroDescription.first.description != ''
                                    ? model.heroDescription.first.description
                                    : 'Нет описания',
                                style: const TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              )
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
