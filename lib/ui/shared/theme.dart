import 'package:flutter/material.dart';

import 'constants.dart';

// Light/Primary Theme | Default Theme
ThemeData themeData(BuildContext context) {
  return ThemeData(
      brightness: Brightness.light,
      appBarTheme: appBarTheme,
      primaryColor: lightBackgroundColor,
      accentColor: kAccentLightColor,
      scaffoldBackgroundColor: Colors.white,
      colorScheme: ColorScheme.light(
        secondary: kSecondaryLightColor,
        // on light theme surface = Colors.white by default
      ),
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.orangeAccent),
      accentIconTheme: IconThemeData(color: kAccentIconLightColor),
      primaryIconTheme: IconThemeData(color: kPrimaryIconLightColor),
      textTheme: TextTheme().copyWith(
        bodyText1: TextStyle(color: kBodyTextColorLight),
        bodyText2: TextStyle(color: kBodyTextColorLight),
        headline2: TextStyle(
          color: Color(0XFFFFFFFF), fontSize: 26, fontWeight: FontWeight.w500),
        headline3: TextStyle(
          color: Color(0XFFFFFFFF), fontSize: 35, fontWeight: FontWeight.w300),
        headline4: TextStyle(color: Color(0XFFFFFFFF), fontSize: 26),
        headline6: TextStyle(color: kTitleTextLightColor, fontSize: 15),
      headline1: TextStyle(color: Color(0XFFFFFFFF), fontSize: 14,fontWeight: FontWeight.w300),
      headline5: TextStyle(color: Color(0XFFFFFFFF), fontSize: 18),

      ),
      cardColor: lightCardColor);
}

// Dark Them
ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    primaryColor: darkBackgroundColor,
    accentColor: kAccentDarkColor,
    scaffoldBackgroundColor: Color(0xFF0D0C0E),
    appBarTheme: appBarTheme,
    colorScheme: ColorScheme.light(
      secondary: kSecondaryDarkColor,
      surface: kSurfaceDarkColor,
    ),
    backgroundColor: kBackgroundDarkColor,
    iconTheme: IconThemeData(color: kBodyTextColorDark),
    accentIconTheme: IconThemeData(color: kAccentIconDarkColor),
    primaryIconTheme: IconThemeData(color: kPrimaryIconDarkColor),
    cardColor: darkCardColor,
    textTheme: TextTheme().copyWith(
      bodyText1: TextStyle(color: kBodyTextColorLight),
      bodyText2: TextStyle(color: kBodyTextColorLight),
      headline2: TextStyle(
          color: Color(0XFFE4E4E4), fontSize: 26, fontWeight: FontWeight.w500),
      headline3: TextStyle(
          color: Color(0XFFE4E4E4), fontSize: 35, fontWeight: FontWeight.w300),
      headline4: TextStyle(color: Color(0XFFE4E4E4), fontSize: 26),
      headline5: TextStyle(color: Color(0XFFE4E4E4), fontSize: 18),
      headline6: TextStyle(color: Color(0XFFE4E4E4), fontSize: 15),
      headline1: TextStyle(color: Color(0XFFE4E4E4), fontSize: 14,fontWeight: FontWeight.w300),

      
    ),
  );
}

AppBarTheme appBarTheme = AppBarTheme(color: Colors.transparent, elevation: 0);
