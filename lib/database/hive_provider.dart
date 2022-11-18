import 'package:flutter/cupertino.dart';
import 'package:flutter_labs/models/image.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/hero_marvel.dart';

class HiveProvider extends ChangeNotifier {
  List<HeroMarvel> listHeroMarvelHive = [];

  HiveProvider();

  Future<List<HeroMarvel>> getInfo() async {
    if (!Hive.isAdapterRegistered(1) && !Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(ModelImageAdapter());
      Hive.registerAdapter(HeroMarvelAdapter());
    }
    var hiveHeroListBox = await Hive.openBox('aaa');

    listHeroMarvelHive = hiveHeroListBox.get('hero').cast<HeroMarvel>();

    hiveHeroListBox.close;
    notifyListeners();
    return listHeroMarvelHive;
  }

  void saveInfo(List<HeroMarvel> listHero) async {
    if (!Hive.isAdapterRegistered(1) && !Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(ModelImageAdapter());
      Hive.registerAdapter(HeroMarvelAdapter());
    }
    var hiveHeroListBox = await Hive.openBox('aaa');

    await hiveHeroListBox.put('hero', listHero);

    notifyListeners();
    hiveHeroListBox.close;
  }
}
