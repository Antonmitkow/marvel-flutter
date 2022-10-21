import '../utils/assets_constants.dart';

class HeroMarvel {
  final int id;
  final String name;
  final String image;
  final String description;

  const HeroMarvel(this.id, this.name, this.image, this.description);
}

List<HeroMarvel> heroList = [
  const HeroMarvel(1, 'Deadpool', ImagesConstants.deadpool,
      'Please don`t make the super suit green...or animated'),
  const HeroMarvel(2, 'Iron Man', ImagesConstants.ironMan, 'I AM IRON MAN'),
  const HeroMarvel(3, 'Captain America', ImagesConstants.captainAmerica,
      'I AM CAPTAIN AMERICA'),
  const HeroMarvel(4, 'Spiderman', ImagesConstants.spiderman, 'I AM SPIDERMAN'),
  const HeroMarvel(5, 'Doctor Strange', ImagesConstants.doctorStrange,
      'I AM DOCTOR STRANGE'),
  const HeroMarvel(6, 'Thor', ImagesConstants.thor, 'I AM THOR'),
  const HeroMarvel(7, 'Thanos', ImagesConstants.thanos, 'I AM THANOS'),
];
