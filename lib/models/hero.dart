import '../utils/assets_constants.dart';

class Hero {
  final int id;
  final String name;
  final String image;

  Hero(this.id, this.name, this.image);
}

List<Hero> heroList = [
  Hero(1, 'Deadpool', ImagesConstants.deadpool),
  Hero(2, 'Iron Man', ImagesConstants.ironMan),
  Hero(3, 'Captain America', ImagesConstants.captainAmerica),
  Hero(4, 'Spiderman', ImagesConstants.spiderman),
  Hero(5, 'Doctor Strange', ImagesConstants.doctorStrange),
  Hero(6, 'Thor', ImagesConstants.thor),
  Hero(7, 'Thanos', ImagesConstants.thanos),
];
