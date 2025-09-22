import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mentorship_week_two/Modules/Global/global_screen.dart';

import '../../../Utilites/theme_helper.dart';
import '../../../generated/assets.dart';
import '../../Details/details_screen.dart';
import '../../Search/search_screen.dart';
import '../../Settings/settings_screen.dart';
import '../home_screen.dart';

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

    return Stack(
      children: [
        // Main BottomNavigationBar Container
        Container(
          height: 72.h,
          decoration: BoxDecoration(
            color: ThemeClass.of(context).background,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
            boxShadow: [
              BoxShadow(
                color: ThemeClass.of(context).waiting,
                blurRadius: 0.5,
                spreadRadius: 0.5,
              ),
            ],
          ),
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
      ],
    );
  }


  Widget buildSelectedIcon(BottomNavBarItemModel item, BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsetsDirectional.only(bottom: 0.h),
        child: SvgPicture.asset(
          item.selectedIconPath,
          colorFilter: ColorFilter.mode(
              ThemeClass.of(context).primaryColor, BlendMode.srcIn),
        ),
      ),
    );
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
    search,
    global,
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

  static BottomNavBarItemModel search = BottomNavBarItemModel(
    iconPath: Assets.imagesSearch,
    selectedIconPath: Assets.imagesSearch,
    title: "",
    routeName:SearchScreen.routeName,
    type: SelectedBottomNavBar.search,
  );
  static BottomNavBarItemModel global = BottomNavBarItemModel(
    iconPath: Assets.imagesGlobal,
    selectedIconPath: Assets.imagesGlobal,
    title:"",
    routeName:GlobalScreen.routeName,
    type: SelectedBottomNavBar.global,
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
  search,
  global,
  settings,
}
