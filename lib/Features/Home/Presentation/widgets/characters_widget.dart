import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../Domain/Entities/character_model.dart';
import '../../../../Utilites/text_style_helper.dart';
import '../../../../Utilites/theme_helper.dart';
import '../../../../core/Widgets/custom_text.dart';

class CharactersWidget extends StatelessWidget {
  final CharacterModel characterModel;

  const CharactersWidget({super.key, required this.characterModel});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 104.w,
      height: 136.h,
      child: Column(
       crossAxisAlignment:CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50.r,
            backgroundImage: AssetImage(characterModel.image ?? ""),
          ),
          Gap(6.h),
          CustomText(
            text: characterModel.title,
            textStyle: TextStyleHelper.of(context).h_15.copyWith(
                color: ThemeClass.of(context).mainBlack,
                fontWeight: FontWeight.w600),
          ),
          CustomText(
            text: characterModel.subTitle,
            textStyle: TextStyleHelper.of(context).h_17.copyWith(
                color: ThemeClass.of(context).secondaryBlackColor,
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
