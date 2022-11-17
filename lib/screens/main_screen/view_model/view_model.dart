import 'package:flutter/material.dart';

import '../../../models/hero_description.dart';
import '../../../models/hero_marvel.dart';
import '../../../network/base_url.dart';
import '../../../network/dio_client.dart';
import '../../../network/hero_repository.dart';

class ViewModelState {
  bool isLoadingHeroList = false;
  bool isLoadingDescription = false;

  ViewModelState();
}

class ViewModel extends ChangeNotifier {
  List<HeroMarvel> listHero = [];
  List<HeroDescription> heroDescription = [];

  HeroRepository heroRepository = HeroRepository(dioClient: DioClient());

  final _state = ViewModelState();

  ViewModelState get state => _state;

  ViewModel() {
    getHeroList();
  }

  Future<List<HeroMarvel>> getHeroList() async {
    _state.isLoadingHeroList = true;
    listHero = await heroRepository.getHeroList(timeStamp, publicKey, hash);
    listHero.isEmpty
        ? _state.isLoadingHeroList = false
        : _state.isLoadingHeroList = true;
    notifyListeners();
    return listHero;
  }

  Future<List<HeroDescription>> getDescriptionById(int id) async {
    _state.isLoadingDescription = true;
    heroDescription =
        await heroRepository.getHeroById(id, timeStamp, publicKey, hash);
    _state.isLoadingDescription = false;

    notifyListeners();
    return heroDescription;
  }

  deleteDescription() {
    heroDescription.clear();
    _state.isLoadingDescription = true;
    notifyListeners();
  }
}
