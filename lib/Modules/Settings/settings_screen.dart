import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:mentorship_week_two/Utilites/text_style_helper.dart';
import 'package:mentorship_week_two/Widgets/custom_text.dart';

import '../../Utilites/theme_helper.dart';
import '../../generated/assets.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = 'settings';
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Image.asset(Assets.imagesStarOne),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Gap(60.h),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 100.w),
                  child: Row(
                    children: [
                      CustomText(
                        text: "Upgrade Plan",
                        textStyle: TextStyleHelper.of(context).h_24,
                      ),
                      Gap(80.w),
                      Image.asset(
                        Assets.imagesCancel,
                        width: 30.w,
                        height: 27.w,
                      ),
                    ],
                  ),
                ),
                Image.asset(Assets.imagesRocket, width: 207.w, height: 260.h),
                SizedBox(
                  width: 298.w,
                  child: Padding(
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 24.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.symmetric(
                            horizontal: 4.w,
                          ),
                          child: CustomText(
                            text: "Seamless Anime Experience, Ad-Free.",
                            textStyle: TextStyleHelper.of(context).h_26,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        CustomText(
                          text:
                              "Enjoy unlimited anime streaming without interruptions.",
                          textStyle: TextStyleHelper.of(context).h_17.copyWith(
                            color: ThemeClass.of(context).secondaryBlackColor,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                Gap(40.h),
                Container(
                  width: 342.w,
                  height: 102.h,
                  decoration: BoxDecoration(
                    color: ThemeClass.of(context).success,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(Assets.imagesFiles),
                      Container(
                        width: 132.w,
                        height: 65.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            CustomText(
                              text: "Monthly",
                              textStyle: TextStyleHelper.of(
                                context,
                              ).h_16.copyWith(
                                color: ThemeClass.of(context).background,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "\$5 USD ",
                                  style: TextStyleHelper.of(
                                    context,
                                  ).h_14.copyWith(
                                    color: ThemeClass.of(context).background,
                                  ),
                                ),
                                Text(
                                  "/Month",
                                  style: TextStyleHelper.of(
                                    context,
                                  ).h_14.copyWith(
                                    color:
                                        ThemeClass.of(
                                          context,
                                        ).secondaryBlackColor,
                                  ),
                                ),
                              ],
                            ),
                            CustomText(
                              text: "Include Family Sharing",
                              textStyle: TextStyleHelper.of(
                                context,
                              ).h_12.copyWith(
                                color:
                                    ThemeClass.of(context).secondaryBlackColor,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsetsDirectional.only(bottom: 40.h),
                        child: SvgPicture.asset(Assets.imagesTickCircle),
                      ),
                    ],
                  ),
                ),
                Gap(12.h),
                Container(
                  width: 342.w,
                  height: 102.h,
                  decoration: BoxDecoration(
                    color: ThemeClass.of(context).background,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(Assets.imagesFiles),
                      Container(
                        width: 132.w,
                        height: 65.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "Annually",
                              textStyle: TextStyleHelper.of(
                                context,
                              ).h_16.copyWith(
                                color: ThemeClass.of(context).mainBlack,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "\$50 USD ",
                                  style: TextStyleHelper.of(
                                    context,
                                  ).h_14.copyWith(
                                    color: ThemeClass.of(context).mainBlack,
                                  ),
                                ),
                                Text(
                                  "/Year",
                                  style: TextStyleHelper.of(
                                    context,
                                  ).h_14.copyWith(
                                    color:
                                        ThemeClass.of(
                                          context,
                                        ).secondaryBlackColor,
                                  ),
                                ),
                              ],
                            ),
                            CustomText(
                              text: "Include Family Sharing",
                              textStyle: TextStyleHelper.of(
                                context,
                              ).h_12.copyWith(
                                color:
                                    ThemeClass.of(context).secondaryBlackColor,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsetsDirectional.only(bottom: 40.h),
                        child: SvgPicture.asset(Assets.imagesDarkElipse),
                      ),
                    ],
                  ),
                ),
                Gap(30.h),
                Container(
                  width: 343.w,
                  height: 46.h,
                  decoration: BoxDecoration(
                    color: ThemeClass.of(context).secondary,
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: Padding(
                    padding:  EdgeInsetsDirectional.only(top:12.h),
                    child: CustomText(
                      text: "Continue",
                      textStyle: TextStyleHelper.of(
                        context,
                      ).h_16.copyWith(color: ThemeClass.of(context).background),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
