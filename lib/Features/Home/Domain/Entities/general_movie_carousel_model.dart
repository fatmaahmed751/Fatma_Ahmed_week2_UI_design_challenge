import '../../../../generated/assets.dart';

class CarouselData {
  final String imagePath;
  final String title;
  final String subtitle;
  final double rate;

  CarouselData({
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.rate,
  });
  static List<CarouselData> carouselData = [
    CarouselData(
      imagePath: Assets.imagesMovieOne,
      title: 'Detective Conan',
      subtitle: 'Mystery',
      rate: 4.5,
    ),
    CarouselData(
      imagePath: Assets.imagesMovieTwo,
      title: 'Hunter x Hunter',
      subtitle: 'Adventure',
      rate: 4.5,
    ),
    CarouselData(
      imagePath: Assets.imagesMovieThree,
      title: 'Demon Slayer',
      subtitle: 'Demon',
      rate: 4.5,
    ),
  ];
}
