import 'package:flutter/material.dart';
import 'package:flutter_labs/models/hero_description.dart';
import 'package:flutter_labs/screens/main_screen/widgets/widget_list_hero.dart';
import 'package:flutter_labs/screens/main_screen/widgets/widget_logo.dart';
import 'package:flutter_labs/screens/main_screen/widgets/widget_text.dart';
import 'package:flutter_labs/theme/colors_constants.dart';
import 'package:flutter_labs/theme/ui/error_widget.dart';
import 'package:provider/provider.dart';

import '../../models/hero_marvel.dart';
import '../../network/base_url.dart';
import '../../network/dio_client.dart';
import '../../network/hero_repository.dart';

class ViewModelState {
  bool isLoadingHeroList = false;
  bool isLoadingDescription = false;
  int statusCode = 0;

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
    listHero = await heroRepository.getHeroList(timeStamp, publicKey, hash);
    _state.isLoadingHeroList = true;
    notifyListeners();
    return listHero;
  }

  Future<List<HeroDescription>> getDescriptionById(int id) async {
    heroDescription =
        await heroRepository.getHeroById(id, timeStamp, publicKey, hash);
    _state.isLoadingDescription = true;

    notifyListeners();
    return heroDescription;
  }

  deleteDescription() {
    heroDescription.clear();
    _state.isLoadingDescription = true;
    notifyListeners();
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final loading =
        context.select((ViewModel value) => value.state.isLoadingHeroList);
    final modelListHero = context.watch<ViewModel>();
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const WidgetLogo(),
            const WidgetTextMainScreen(),
            loading
                ? Expanded(
                    child: modelListHero.listHero != []
                        ? WidgetListHero(
                            listHero: modelListHero.listHero,
                          )
                        : const NetworkErrorWidget(),
                  )
                : const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
          ],
        ),
      ),
      backgroundColor: ConstantsColors.backgroundColor,
    );
  }
}
