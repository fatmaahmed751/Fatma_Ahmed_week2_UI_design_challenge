import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mentorship_week_two/core/Widgets/bottom_navbar_widget.dart';
import 'package:mentorship_week_two/Utilites/text_style_helper.dart';
import '../../Domain/Entities/character_model.dart';
import '../../Domain/Entities/general_movie_carousel_model.dart';
import '../../Domain/Entities/types_movie_model.dart';
import '../../../../Utilites/theme_helper.dart';
import '../../../../core/Widgets/custom_text.dart';
import '../../../../generated/assets.dart';
import '../widgets/characters_widget.dart';
import '../widgets/custom_carousel_home_container_widget.dart';
import '../widgets/list_of_movies_types.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: const BottomNavBarWidget(
        selected: SelectedBottomNavBar.home,
      ),
      body: Stack(
          children: [
          Image.asset(Assets.imagesStarOne),
       SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal:12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(20.h),
                CustomText(
                  text: "Where Anime Comes Alive",
                  textStyle: TextStyleHelper.of(context).h_24,
                  color: ThemeClass.of(context).mainBlack,
                ),
                Gap(12.h),
                SizedBox(
                  height: 40.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder:
                        (context, index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Padding(
                            padding: EdgeInsetsDirectional.symmetric(
                              horizontal: 4.w,
                            ),
                            child: TypesOfMoviesWidget(
                              index: index,
                              selectedIndex: selectedIndex,
                            ),
                          ),
                        ),
                    separatorBuilder: (context, index) => Gap(4.w),
                    itemCount: TypesOfMovies.typesOfMovie.length,
                  ),
                ),
                Gap(16.h),
                SizedBox(
                  height: 400.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return HomeCarouselWidget(
                        carouselItems: CarouselData.carouselData[index],
                      );
                    },
                    separatorBuilder: (context, index) => Gap(12.w),
                    itemCount: CarouselData.carouselData.length,
                  ),
                ),

                CustomText(
                  text: "Top Characters",
                  textStyle: TextStyleHelper.of(context).h_24,
                  color: ThemeClass.of(context).mainBlack,
                ),
                Gap(8.h),
                SizedBox(
                  height: 160.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CharactersWidget(
                        characterModel: CharacterModel.character[index],
                      );
                    },
                    separatorBuilder: (context, index) => Gap(12.w),
                    itemCount:  CharacterModel.character.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ]
      ),
    );
  }
}
