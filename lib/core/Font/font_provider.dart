import 'package:flutter/material.dart';


enum FontFamilyTypes {tajawal,cairo,poppins}

class FontProvider extends ChangeNotifier {

  static const maxScaleSize = 3;
  static const minScaleSize = 0.3;
  static const double _defaultFontScaleSize = 1;
  static const FontFamilyTypes _defaultFontFamily = FontFamilyTypes.tajawal;

  double _fontSizeScale = 1.0;
  double get fontSizeScale => _fontSizeScale;

  FontFamilyTypes _fontFamily = _defaultFontFamily;
  FontFamilyTypes get fontFamily => _fontFamily;


  void fetchFontSettings() {
    _fontSizeScale = _defaultFontScaleSize;
    _fontFamily = _defaultFontFamily;
  }


  Future changeFontFamily({required FontFamilyTypes fontFamily}) async {
    if(_fontFamily == fontFamily) return;
    _fontFamily = fontFamily;
   // await SharedPref.setFontFamily(fontFamily: fontFamily);
    notifyListeners();
  }

  Future changeFontSizeScale({required double fontSizeScale}) async {
    if(_fontSizeScale == fontSizeScale) return;
    if(fontSizeScale >= maxScaleSize || fontSizeScale<=minScaleSize) return;
    _fontSizeScale = fontSizeScale;
   // await SharedPref.setFontSizeScale(fontSizeScale: fontSizeScale);
    notifyListeners();
  }
}
