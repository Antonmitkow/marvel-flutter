import 'package:flutter/material.dart';
import 'package:flutter_labs/screens/main_screen/widgets/widget_list_hero.dart';
import 'package:flutter_labs/screens/main_screen/widgets/widget_logo.dart';
import 'package:flutter_labs/screens/main_screen/widgets/widget_text.dart';
import 'package:flutter_labs/utils/colors_constants.dart';
import 'package:provider/provider.dart';

import '../../models/hero.dart';
import '../../network/base_url.dart';
import '../../network/dio_client.dart';
import '../../network/hero_repository.dart';

class ViewModelState {
  bool isLoading = false;

  ViewModelState();
}

class ViewModel extends ChangeNotifier {
  HeroRepository heroRepository = HeroRepository(dioClient: DioClient());
  List<HeroMarvel> listHero = [];
  final _state = ViewModelState();

  ViewModelState get state => _state;

  ViewModel() {
    getInfo();
  }

  Future<List<HeroMarvel>> getInfo() async {
    listHero = await heroRepository.getHeroList(timeStamp, publicKey, hash);
    _state.isLoading = true;
    notifyListeners();
    return listHero;
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
    final loading = context.select((ViewModel value) => value._state.isLoading);
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
                    child: WidgetListHero(
                    listHero: modelListHero.listHero,
                  ))
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
