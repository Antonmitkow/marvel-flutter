import 'package:flutter/material.dart';

class WidgetHeroCard extends StatelessWidget {
  final String name;
  final int index;
  final ImageProvider imageProvider;
  const WidgetHeroCard(
      {Key? key,
      required this.name,
      required this.index,
      required this.imageProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Hero(
        tag: 'heroMarvel$index',
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover)),
          child: DefaultTextStyle(
              style: Theme.of(context).textTheme.headline2!,
              child: Stack(
                children: [
                  Positioned(
                    child: Text(
                      name,
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
  }
}
