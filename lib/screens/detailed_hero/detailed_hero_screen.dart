import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_labs/screens/main_screen/main_screen.dart';
import 'package:provider/provider.dart';

class DetailedHeroScreen extends StatelessWidget {
  final int id;
  final String image;
  final String name;
  final int index;
  const DetailedHeroScreen(
      {Key? key,
      required this.image,
      required this.name,
      required this.index,
      required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loading =
        context.select((ViewModel value) => value.state.isLoadingDescription);
    final model = context.watch<ViewModel>();
    model.getDescriptionById(id);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Stack(
                children: [
                  Hero(
                      tag: 'heroMarvel$index',
                      child: CachedNetworkImage(
                        imageUrl: image,
                        fit: BoxFit.cover,
                        height: double.infinity,
                      )),
                  Positioned(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                              fontSize: 34,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 10),
                        loading
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
