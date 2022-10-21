import 'package:flutter/material.dart';
import 'package:flutter_labs/utils/assets_constants.dart';

class DetailedHeroScreen extends StatelessWidget {
  final String image;
  final String name;
  final String description;
  const DetailedHeroScreen(
      {Key? key,
      required this.image,
      required this.name,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(ImagesConstants.deadpool))),
                child: Stack(
                  children: [
                    Hero(
                        tag: 'heroMarvel',
                        child: Image.asset(
                          image,
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
            ),
            const Positioned(
              child: BackButton(
                color: Colors.white,
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
