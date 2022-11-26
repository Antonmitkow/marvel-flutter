import 'package:flutter/material.dart';
import 'package:flutter_labs/database/hive_provider.dart';
import 'package:flutter_labs/screens/main_screen/main_screen.dart';
import 'package:flutter_labs/theme/theme.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'screens/main_screen/view_model/view_model.dart';

void main() async {
  await Hive.initFlutter();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ViewModel()),
      ChangeNotifierProvider(
        create: (_) => HiveProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final modelListHero = context.watch<ViewModel>();
    final modelHive = context.watch<HiveProvider>();

    modelListHero.listHero.isEmpty
        ? modelHive.getInfo()
        : modelListHero.listHero;
    final listHero = modelListHero.listHero.isEmpty
        ? modelHive.listHeroMarvelHive
        : modelListHero.listHero;
    return MaterialApp(
      title: 'Marvel',
      theme: theme,
      home: MainScreen(
        listHero: listHero,
      ),
    );
  }
}
