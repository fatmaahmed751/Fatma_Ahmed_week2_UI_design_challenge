import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import '../../../Models/general_movie_carousel_model.dart';
import '../../../Utilites/text_style_helper.dart';
import '../../../Utilites/theme_helper.dart';
import '../../../generated/assets.dart';

class HomeCarouselWidget extends StatefulWidget {
  final CarouselData carouselItems;
  const HomeCarouselWidget({
    super.key,
    required this.carouselItems,
  });

  @override
  State<HomeCarouselWidget> createState() => _HomeCarouselWidgetState();
}

class _HomeCarouselWidgetState extends State<HomeCarouselWidget> {

  @override
  Widget build(BuildContext context) {
    final item = widget.carouselItems;
    return Column(
      children: [
        Column(
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  width: 250.w,
                  height: 350.h,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child:  ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.asset(
                      item.imagePath,
                      fit: BoxFit.cover,
                      width: 250.w,
                      height: 350.h,
                    ),
                  ),
                 // Image.asset(item.imagePath, fit: BoxFit.cover),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.symmetric(
                    horizontal: 8.w,
                    vertical: 8.h,
                  ),
                  child: Container(
                    width: 41.w,
                    height: 20.h,
                    decoration: BoxDecoration(
                      color: ThemeClass.of(context).background,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Padding(
                      padding:  EdgeInsetsDirectional.symmetric(vertical: 4.h,horizontal: 2.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(Assets.imagesStar),
                          Gap(2.w),
                          Text(
                            "${item.rate}",
                            style: TextStyleHelper.of(context).b_12.copyWith(
                              color: ThemeClass.of(context).mainBlack,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Gap(4.h),
            Text(item.title, style: TextStyleHelper.of(context).h_14),
            Gap(2.h),
            Text(
              item.subtitle,
              style: TextStyleHelper.of(context).h_14.copyWith(
                color: ThemeClass.of(context).secondaryBlackColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
