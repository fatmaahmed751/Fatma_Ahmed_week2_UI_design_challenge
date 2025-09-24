import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship_week_two/Utilites/text_style_helper.dart';

import '../../../../Utilites/theme_helper.dart';

class TypeOfMovieWidget extends StatelessWidget {
  final String text;
  const TypeOfMovieWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height:35.h ,
      width:97.w ,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: const Offset(0, 4),
              blurRadius: 6,
              spreadRadius: 0,
            ),
          ],
        borderRadius: BorderRadius.circular(16.r),
          color:Color.fromRGBO(217, 217, 217, 0.24)
      ),
      child:Center(
        child: Padding(
          padding:  EdgeInsetsDirectional.only(top: 0.h),
          child: Text(text,
          style: TextStyleHelper.of(context).b_12.copyWith(
            color: ThemeClass.of(context).background
          ),),
        ),
      ) ,
    );
  }
}
