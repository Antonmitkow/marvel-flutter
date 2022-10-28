import '../utils/assets_constants.dart';

class Hero {
  final int id;
  final String name;
  final String image;

  const Hero(this.id, this.name, this.image);
}

List<Hero> heroList = [
  const Hero(1, 'Deadpool', ImagesConstants.deadpool),
  const Hero(2, 'Iron Man', ImagesConstants.ironMan),
  const Hero(3, 'Captain America', ImagesConstants.captainAmerica),
  const Hero(4, 'Spiderman', ImagesConstants.spiderman),
  const Hero(5, 'Doctor Strange', ImagesConstants.doctorStrange),
  const Hero(6, 'Thor', ImagesConstants.thor),
  const Hero(7, 'Thanos', ImagesConstants.thanos),
];
