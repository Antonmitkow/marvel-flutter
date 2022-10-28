import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailedHeroScreen extends StatelessWidget {
  final String image;
  final String name;
  final String description;
  final int index;
  const DetailedHeroScreen(
      {Key? key,
      required this.image,
      required this.name,
      required this.description,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        Text(
                          description,
                          style: const TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
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
                color: index == 0 || index == 3 ? Colors.black : Colors.white,
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
