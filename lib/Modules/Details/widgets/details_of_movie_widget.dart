import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mentorship_week_two/Utilites/text_style_helper.dart';

import '../../../Utilites/theme_helper.dart';

class DetailsOfMovieWidget extends StatelessWidget {
  final String text;
  final String icon;
  const DetailsOfMovieWidget({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height:16.h ,
      width:93.w ,
      child:Center(
        child: Padding(
          padding:  EdgeInsetsDirectional.only(top: 4.h),
          child: Row(
            children: [
              SvgPicture.asset(icon),
              Text(text,
                style: TextStyleHelper.of(context).b_14.copyWith(
                    color: ThemeClass.of(context).background
                ),),
            ],
          ),
        ),
      ) ,
    );
  }
}
