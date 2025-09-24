import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import '../../Features/Animation/Presentation/views/animation_screen.dart';
import '../../Features/Home/Presentation/views/home_screen.dart';
import '../../Features/MovieDetails/Presentation/views/details_screen.dart';
import '../../Features/Settings/presentation/views/settings_screen.dart';
import '../../Features/WidgetsCatalog/Prsentation/views/widgets_catalog.dart';
import '../../Utilites/theme_helper.dart';
import '../../generated/assets.dart';

class BottomNavBarWidget extends StatefulWidget {
  final SelectedBottomNavBar selected;

  const BottomNavBarWidget({Key? key, required this.selected})
      : super(key: key);

  @override
  State<BottomNavBarWidget>createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  void initState() {
    super.initState();
  }

  int selectedLanguage = 1;
  @override

  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth = screenWidth / BottomNavBarItemModel.screens.length;
    final selectedPosition = widget.selected.index * itemWidth;

    return  Container(
      height: 76.h,
      decoration: BoxDecoration(
        color: ThemeClass.of(context).background,
        boxShadow: [
          BoxShadow(
            color: ThemeClass.of(context).waiting,
            blurRadius: 0.5,
            spreadRadius: 0.5,
          ),
        ],
      ),
      child: Padding(
        padding:  EdgeInsetsDirectional.only(start: 6.w,top: 6.h),
        child: BottomNavigationBar(
          backgroundColor: ThemeClass.of(context).background,
          currentIndex: widget.selected.index,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: ThemeClass.of(context).primaryColor,
          unselectedItemColor: ThemeClass.of(context).secondaryBlackColor,
          onTap: (index) {
            context.pushNamed(BottomNavBarItemModel.screens[index].routeName);
          },
          items: BottomNavBarItemModel.screens.map((item) {
            final isSelected = item.type == widget.selected;
            return BottomNavigationBarItem(
              icon: isSelected
                  ? buildSelectedIcon(item, context)
                  : buildUnselectedIcon(item, context),
              label: "",
            );
          }).toList(),
        ),
      ),
    );
  }
  Widget buildSelectedIcon(BottomNavBarItemModel item, BuildContext context) {
    if (item.type == SelectedBottomNavBar.home) {
      return Container(
        width: 100.w,
        height: 30.h,
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 0.h),
        decoration: BoxDecoration(
          color: ThemeClass.of(context).mainSecondary,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              item.selectedIconPath,
              width: 17.w,
              height: 17.h,
              colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
            Gap( 4.w),
            Text(
              "Home",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsetsDirectional.only(top: 10.h),
        child: SvgPicture.asset(
          item.selectedIconPath,
          colorFilter: ColorFilter.mode(
            ThemeClass.of(context).primaryColor,
            BlendMode.srcIn,
          ),
        ),
      );
    }
  }


  Widget buildUnselectedIcon(BottomNavBarItemModel item, BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(bottom: 0.h),
      child: SvgPicture.asset(
        item.iconPath,
        colorFilter: ColorFilter.mode(
            ThemeClass.of(context).secondaryBlackColor,
            BlendMode.srcIn),
      ),
    );
  }
}

class BottomNavBarItemModel {
  final String iconPath;
  final String selectedIconPath;
  final String title;
  final String routeName;
  final SelectedBottomNavBar type;

  BottomNavBarItemModel({
    required this.iconPath,
    required this.selectedIconPath,
    required this.title,
    required this.routeName,
    required this.type,
  });

  static List<BottomNavBarItemModel> screens = [
    home,
    details,
    widgetsCatalog,
    animations,
    settings,
  ];

  static BottomNavBarItemModel home = BottomNavBarItemModel(
    iconPath: Assets.imagesHome,
    selectedIconPath: Assets.imagesHome,
    title: "home",
    routeName: HomeScreen.routeName,
    type: SelectedBottomNavBar.home,
  );

  static BottomNavBarItemModel details = BottomNavBarItemModel(
    iconPath: Assets.imagesDetails,
    selectedIconPath: Assets.imagesDetails,
    title: "",
    routeName: DetailsScreen.routeName,
    type: SelectedBottomNavBar.details,
  );

  static BottomNavBarItemModel widgetsCatalog = BottomNavBarItemModel(
    iconPath: Assets.imagesSearch,
    selectedIconPath: Assets.imagesSearch,
    title: "",
    routeName:WidgetsCatalog.routeName,
    type: SelectedBottomNavBar.widgetsCatalog,
  );
  static BottomNavBarItemModel animations = BottomNavBarItemModel(
    iconPath: Assets.imagesGlobal,
    selectedIconPath: Assets.imagesGlobal,
    title:"",
    routeName:AnimationScreen.routeName,
    type: SelectedBottomNavBar.animations,
  );
  static BottomNavBarItemModel settings = BottomNavBarItemModel(
    iconPath: Assets.imagesSetting,
    selectedIconPath: Assets.imagesSetting,
    title: "",
    routeName: SettingsScreen.routeName,
    type: SelectedBottomNavBar.settings,
  );
}


enum SelectedBottomNavBar {
  home,
  details,
  widgetsCatalog,
  animations,
  settings,
}
