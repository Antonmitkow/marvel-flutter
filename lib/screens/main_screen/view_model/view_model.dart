import 'package:flutter/material.dart';

import '../../../models/hero_description.dart';
import '../../../models/hero_marvel.dart';
import '../../../network/base_url.dart';
import '../../../network/dio_client.dart';
import '../../../network/hero_repository.dart';

class ViewModelState {
  ViewModelState();
}

class ViewModel extends ChangeNotifier {
  bool isLoadingHeroList = false;
  bool isLoadingDescription = false;
  List<HeroMarvel> listHero = [];
  List<HeroDescription> heroDescription = [];

  HeroRepository heroRepository = HeroRepository(dioClient: DioClient());

  // final _state = ViewModelState();

  // ViewModelState get state => _state;

  ViewModel() {
    getHeroList();
  }

  Future<List<HeroMarvel>> getHeroList() async {
    isLoadingHeroList = true;
    notifyListeners();
    listHero = await heroRepository.getHeroList(timeStamp, publicKey, hash);

    isLoadingHeroList = false;

    notifyListeners();
    return listHero;
  }

  Future<List<HeroDescription>> getDescriptionById(int id) async {
    isLoadingDescription = true;
    notifyListeners();

    heroDescription =
        await heroRepository.getHeroById(id, timeStamp, publicKey, hash);

    isLoadingDescription = false;

    notifyListeners();
    return heroDescription;
  }

  deleteDescription() {
    heroDescription.clear();
    isLoadingDescription = true;
    notifyListeners();
  }
}
