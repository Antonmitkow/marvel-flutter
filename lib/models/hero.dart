import '../utils/assets_constants.dart';

class HeroMarvel {
  final int id;
  final String name;
  final String image;
  final String description;

  const HeroMarvel(this.id, this.name, this.image, this.description);
}

List<HeroMarvel> heroList = [
  const HeroMarvel(1, 'Deadpool', NetworkAssetsImages.deadpool,
      'Please don`t make the super suit green...or animated'),
  const HeroMarvel(2, 'Iron Man', NetworkAssetsImages.ironMan, 'I AM IRON MAN'),
  const HeroMarvel(3, 'Captain America', NetworkAssetsImages.captainAmerica,
      'I AM CAPTAIN AMERICA'),
  const HeroMarvel(
      4, 'Spiderman', NetworkAssetsImages.spiderman, 'I AM SPIDERMAN'),
  const HeroMarvel(5, 'Doctor Strange', NetworkAssetsImages.doctorStrange,
      'I AM DOCTOR STRANGE'),
  const HeroMarvel(6, 'Thor', NetworkAssetsImages.thor, 'I AM THOR'),
  const HeroMarvel(7, 'Thanos', NetworkAssetsImages.thanos, 'I AM THANOS'),
];
