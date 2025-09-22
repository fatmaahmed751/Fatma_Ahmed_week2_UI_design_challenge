import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'theme_model.dart';

class ThemeProvider extends ChangeNotifier {
  Color? _primaryColor, _secondaryColor;

  Color? get primaryColor => _primaryColor;
  Color? get secondaryColor => _secondaryColor;

  final ThemeModel _appTheme = ThemeModel.defaultTheme;
  ThemeModel get appTheme => _appTheme.copyWith(
      primaryColor: _primaryColor,
      pTint1: _primaryColor?.withOpacity(0.5),
      pTint2: _primaryColor?.withOpacity(0.4),
      secondary: _secondaryColor,
      sTint1: _secondaryColor?.withOpacity(0.75),
      sTint2: _secondaryColor?.withOpacity(0.5),

  );



  ThemeData? get appThemeMode => _appTheme.isDark ? _darkMode : _lightMode;

  ThemeData get _darkMode => ThemeData.dark(useMaterial3: false).copyWith(
    extensions: <ThemeExtension<ThemeModel>>[_appTheme,],
    popupMenuTheme: PopupMenuThemeData(
      color: const Color(0xff0F0C13),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white.withOpacity(0.18), width: 1.r,),
        borderRadius: BorderRadius.circular(12.r),
      ),
    ),
  );

  ThemeData get _lightMode => ThemeData.light(useMaterial3: false).copyWith(
    extensions: <ThemeExtension<ThemeModel>>[_appTheme,],
    popupMenuTheme: PopupMenuThemeData(
      color: const Color(0xff0F0C13),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white.withOpacity(0.18), width: 1.r,),
        borderRadius: BorderRadius.circular(12.r),
      ),
    ),
  );


}
