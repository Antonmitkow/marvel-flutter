import 'package:flutter/material.dart';
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
      padding:
          const EdgeInsets.only(left: 120, top: 25, right: 120, bottom: 35),
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

class _WidgetListHero extends StatelessWidget {
  const _WidgetListHero({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
