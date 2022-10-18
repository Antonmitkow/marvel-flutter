import 'package:flutter/material.dart';
import 'package:flutter_labs/models/hero.dart';
import 'package:flutter_labs/utils/assets_constants.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            _WidgetLogo(),
            _WidgetTextMainScreen(),
            Expanded(child: _WidgetListHero())
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 53, 53, 53),
    );
  }
}

class _WidgetLogo extends StatelessWidget {
  const _WidgetLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 130, vertical: 25),
      child: Image.asset(ImagesConstants.logo),
    );
  }
}

class _WidgetTextMainScreen extends StatelessWidget {
  const _WidgetTextMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Choose your hero',
      style: TextStyle(
          color: Colors.white, fontSize: 34, fontWeight: FontWeight.w700),
    );
  }
}

class _WidgetListHero extends StatefulWidget {
  const _WidgetListHero({Key? key}) : super(key: key);

  @override
  State<_WidgetListHero> createState() => _WidgetListHeroState();
}

class _WidgetListHeroState extends State<_WidgetListHero> {
  var _currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
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
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                          image: AssetImage(heroList[index].image),
                          fit: BoxFit.cover)),
                  child: DefaultTextStyle(
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w700),
                      child: Stack(
                        children: [
                          Positioned(
                            child: Text(heroList[index].name),
                            left: 30,
                            bottom: 35,
                          )
                        ],
                      )),
                ),
              ),
            ),
          );
        },
        itemCount: heroList.length,
      ),
    );
  }
}
