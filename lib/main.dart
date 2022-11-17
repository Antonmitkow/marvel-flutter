import 'package:flutter/material.dart';
import 'package:flutter_labs/hive_provider.dart';
import 'package:flutter_labs/screens/main_screen/main_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'screens/main_screen/view_model/view_model.dart';

void main() async {
  await Hive.initFlutter();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ViewModel()),
      Provider(
        create: (_) => HiveProvider(),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final modelHive = HiveProvider();

  @override
  Widget build(BuildContext context) {
    final modelListHero = context.watch<ViewModel>();
    modelListHero.listHero.isEmpty
        ? modelHive.getInfo()
        : modelListHero.listHero;
    final listHero = modelListHero.listHero.isEmpty
        ? modelHive.listHeroMarvelHive
        : modelListHero.listHero;
    return MaterialApp(
      title: 'Marvel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(
        listHero: listHero,
      ),
    );
  }
}
