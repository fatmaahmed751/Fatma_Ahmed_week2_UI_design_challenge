import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:mentorship_week_two/Utilites/text_style_helper.dart';

import '../../../../Utilites/theme_helper.dart';
import '../../../../generated/assets.dart';
import '../widgets/details_of_movie_widget.dart';
import '../widgets/type_of_movie_widget.dart';

class DetailsScreen extends StatelessWidget {
  static const routeName = 'details';
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(44, 30, 81, 0.45),
              Color.fromRGBO(44, 30, 81, 0.90),
              Color.fromRGBO(44, 30, 81, 0.90),
            ],
            begin: Alignment.centerRight,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: [
                Image.asset(
                  Assets.imagesDemonMovie,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 440.h,
                ),
                Positioned(
                  bottom: -100.h,
                  right: 0.w,
                  left: 0.w,
                  child: Image.asset(
                    Assets.imagesDemon,
                    width: 193,
                    height: 146,
                  ),
                ),
              ],
            ),
            Gap( 120.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TypeOfMovieWidget(text: "Dark Fantasy"),
                Gap( 12.w),
                TypeOfMovieWidget(text: "Adventure"),
                Gap( 12.w),
                TypeOfMovieWidget(text: "Action"),
              ],
            ),

            Gap(8.h),
           Divider(color: ThemeClass.of(context).secondaryBlackColor,
           thickness: 1.0,
           endIndent: 20.w,
           indent: 20.w,),
            Gap(8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DetailsOfMovieWidget(
                  icon: Assets.imagesEye,
                    text: " 2.3M views"),
                Gap( 12.w),
                DetailsOfMovieWidget(
                  icon: Assets.imagesHandsClapping,
                    size: 20.w,
                    text: "2K clap"),
                Gap( 12.w),
                DetailsOfMovieWidget(
                  icon: Assets.imagesMovie,
                    text: " 4 Seasons"),
              ],
            ),
            Gap(8.h),
            Divider(color: ThemeClass.of(context).secondaryBlackColor,
              thickness: 1.0,
              endIndent: 20.w,
              indent: 20.w,),
            Gap(8.h),
            Padding(
              padding:  EdgeInsetsDirectional.only(start:0.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 SvgPicture.asset(Assets.imagesFire),
                  Gap(12.w),
                  Text(" Step into the world of Demon Slayer",
                  style: TextStyleHelper.of(context).b_16.copyWith(
                    color: ThemeClass.of(context).background
                  ),)
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: 375.w,
        height: 100.h,
        color: ThemeClass.of(context).primaryColor,
        child: Padding(
          padding:  EdgeInsetsDirectional.symmetric(horizontal:20.w ),
          child: Row(
            children: [
              Container(
                height:44.h ,
                width:163.w ,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(37.r),
                    color:Color.fromRGBO(217, 217, 217, 0.24)
                ),
                child:Center(
                  child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(Assets.imagesVector,
                      width: 20.w,),
                      Gap(8.w),
                      Text("preview",
                        style: TextStyleHelper.of(context).b_16.copyWith(
                            color: ThemeClass.of(context).background
                        ),),
                    ],
                  ),
                ) ,
              ),
              Gap(16.w),
              Container(
                height:44.h ,
                width:163.w ,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(37.r),
                    color:ThemeClass.of(context).secondary
                ),
                child:Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(Assets.imagesWhiteEye,
                        width: 20.w,),
                      Gap(8.w),
                      Padding(
                        padding:  EdgeInsets.only(top: 1.h),
                        child: Text("Watch Now",
                          style: TextStyleHelper.of(context).b_16.copyWith(
                              color: ThemeClass.of(context).background
                          ),),
                      ),
                    ],
                  ),
                ) ,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
    //   Scaffold(
    //   body: Container(
    //     decoration: BoxDecoration(
    //       gradient: LinearGradient(
    //         colors: [
    //           Color.fromRGBO(44, 30, 81, 0.45),
    //           Color.fromRGBO(44, 30, 81, 0.90),
    //         ],
    //         begin: Alignment.topCenter,
    //         end: Alignment.bottomCenter,
    //       ),
    //     ),
    //     child:CustomScrollView(
    //       slivers: [
    //         /// البوستر الكبير اللي فوق
    //         SliverAppBar(
    //           backgroundColor: Colors.transparent,
    //           expandedHeight: 440.h,
    //           flexibleSpace: FlexibleSpaceBar(
    //             background: Image.asset(
    //               Assets.imagesDemonMovie,
    //               fit: BoxFit.cover,
    //               width: double.infinity,
    //               height: double.infinity,
    //             ),
    //           ),
    //         ),
    //
    //         /// باقي المحتوى
    //         SliverToBoxAdapter(
    //           child: Padding(
    //             padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               children: [
    //                 /// 👇 هنا الصورة الكبيرة اللي في النص
    //                 Image.asset(
    //                   Assets.imagesDemon,
    //                   width: 193.w,
    //                   height: 146.h,
    //                 ),
    //                 Gap(20.h),
    //
    //                 /// 👇 هنا الـ Row اللي تحتيها
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                   children: [
    //                     TypeOfMovieWidget(text: "Dark Fantasy"),
    //                     Gap(12.w),
    //                     TypeOfMovieWidget(text: "Adventure"),
    //                   ],
    //                 ),
    //
    //                 Gap(20.h),
    //
    //                 /// مثال لباقي محتوى الشاشة
    //                 Text(
    //                   "Description",
    //                   style: TextStyle(color: Colors.white, fontSize: 20.sp),
    //                 ),
    //                 Gap(8.h),
    //                 Text(
    //                   "ده وصف تجريبي للفيلم عشان يبان المحتوى تحت الصورة والـ Row.",
    //                   style: TextStyle(color: Colors.white70, fontSize: 14.sp),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
 // }
//}
        // child: Stack(
        //   children: [
        //     CustomScrollView(
        //       slivers: [
        //         SliverAppBar(
        //           backgroundColor: Colors.transparent,
        //           expandedHeight: 440.h,
        //           flexibleSpace: FlexibleSpaceBar(
        //             background: Image.asset(
        //               Assets.imagesDemonMovie,
        //               fit: BoxFit.cover,
        //               width: double.infinity,
        //               height: double.infinity,
        //             ),
        //           ),
        //         ),
        //         SliverToBoxAdapter(
        //           child: Padding(
        //             padding: EdgeInsetsDirectional.symmetric(
        //               horizontal: 16.w,
        //               vertical: 16.h,
        //             ),
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 Gap(100.h),
        //                 Row(
        //                   mainAxisAlignment: MainAxisAlignment.center,
        //                   children: [
        //                     TypeOfMovieWidget(text: "Dark Fantasy"),
        //                     Gap(12.w),
        //                     TypeOfMovieWidget(text: "Dark Fantasy"),
        //                   ],
        //                 ),],
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //     Positioned(
        //       top: 400.h,
        //       left: 0,
        //       right: 0,
        //       child: Align(
        //         alignment: Alignment.center,
        //         child: Image.asset(
        //           Assets.imagesDemon,
        //           width: 193.w,
        //           height: 146.h,
        //         ),
        //       ),
        //     ),
        //
        //   ],
        // ),
   //   ),
   // );
 // }
//}
