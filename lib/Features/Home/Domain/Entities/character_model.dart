import '../../../../generated/assets.dart';

class CharacterModel {
  final String title;
  final String subTitle;
  final String image;

  CharacterModel({
    required this.title,
    required this.image,
    required this.subTitle,
  });
  static List<CharacterModel> character = [
    CharacterModel(
      image: Assets.imagesEllipseOne,
      title: "Gon Freecss",
      subTitle: "Hunter x Hunter",
    ),

    CharacterModel(
      image: Assets.imagesEllipseTwo,
      title: "Naruto",
      subTitle: "Naruto",
    ),
    CharacterModel(
      image: Assets.imagesEllipseThree,
      title: "Luffy",
      subTitle: "One Piece",
    ),
    CharacterModel(
      image: Assets.imagesEllipseOne,
      title: "Gon Freecss",
      subTitle: "Hunter x Hunter",
    ),
  ];
}
