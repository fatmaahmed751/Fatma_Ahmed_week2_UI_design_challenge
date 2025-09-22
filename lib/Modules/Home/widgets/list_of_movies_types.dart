import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mentorship_week_two/Models/types_movie_model.dart';
import '../../../Utilites/text_style_helper.dart';
import '../../../Utilites/theme_helper.dart';
import '../../../generated/assets.dart';

class TypesOfMoviesWidget extends StatelessWidget {
  final int index;
  final int selectedIndex;
  const TypesOfMoviesWidget({super.key, required this.index, required this.selectedIndex,});


  @override
  Widget build(BuildContext context) {
    final movieType = TypesOfMovies.typesOfMovie[index];
    bool isSelected = index == selectedIndex;
    Color textColor = isSelected ? Colors.white : ThemeClass.of(context).mainSecondary;
    Color containerColor = isSelected ? ThemeClass.of(context).mainSecondary: Colors.white;
    return Container(
      height: 28.h,
      //width:85.w ,
      decoration: BoxDecoration(
        color:containerColor ,
          borderRadius: BorderRadius.circular(20.r),
          ),
      child: Padding(
        padding:
        EdgeInsetsDirectional.symmetric(horizontal: 6.w, vertical: 4.h),
        child: Center(
          child: Text(
            movieType.type,
            style: TextStyleHelper
                .of(context)
                .h_14
                .copyWith(
              color: textColor
            ),
          ),
        ),
      ),
    );
  }
}