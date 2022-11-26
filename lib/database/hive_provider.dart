import 'package:flutter/cupertino.dart';
import 'package:flutter_labs/models/image.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/hero_marvel.dart';

const String _boxName = 'aaa';
const String _keyName = 'hero';

class HiveProvider extends ChangeNotifier {
  List<HeroMarvel> listHeroMarvelHive = [];

  HiveProvider();

  Future<List<HeroMarvel>> getInfo() async {
    if (!Hive.isAdapterRegistered(1) && !Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(ModelImageAdapter());
      Hive.registerAdapter(HeroMarvelAdapter());
    }
    var hiveHeroListBox = await Hive.openBox(_boxName);

    listHeroMarvelHive =
        hiveHeroListBox.get(_keyName)?.cast<HeroMarvel>() ?? [];

    hiveHeroListBox.close;
    notifyListeners();
    return listHeroMarvelHive;
  }

  void saveInfo(List<HeroMarvel> listHero) async {
    if (!Hive.isAdapterRegistered(1) && !Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(ModelImageAdapter());
      Hive.registerAdapter(HeroMarvelAdapter());
    }
    var hiveHeroListBox = await Hive.openBox(_boxName);

    await hiveHeroListBox.put(_keyName, listHero);

    notifyListeners();
    hiveHeroListBox.close;
  }
}
