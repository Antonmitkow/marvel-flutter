import 'package:dio/dio.dart';
import 'package:flutter_labs/models/hero.dart';
import 'package:flutter_labs/network/dio_client.dart';

class HeroRepository {
  final DioClient _dioClient;
  List<HeroMarvel> heroMarvel = [];

  HeroRepository({required DioClient dioClient}) : _dioClient = dioClient;

  Future<List<HeroMarvel>> getHeroList(
      String timeStamp, String publicKey, String hash) async {
    try {
      final response = await _dioClient.dio
          .get('ts=$timeStamp&apikey=$publicKey&hash=$hash');

      for (var item in response.data['data']['results']) {
        heroMarvel.add(HeroMarvel.fromMap(item));
      }
    } on DioError catch (e) {
      print('STATUS: ${e.response?.statusCode}');
      print('DATA: ${e.response?.data}');
      print('HEADERS: ${e.response?.headers}');
    }

    return heroMarvel;
  }
}
