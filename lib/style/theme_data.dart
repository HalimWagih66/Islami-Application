import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyThemeData {
  static const Color lightPrimaryColor =  Color(0xffB7935F);
  static const Color darkPrimaryColor =  Color(0xff141A2E);
  static const Color lightMainTextColor = Color(0xFF242424);
  static const Color darkMainTextColor = Color(0xFFF8F8F8);
  static const Color darkAccentColor = Color(0xFFFACC1D);
  static const Color lightAccentColor = Color(0xFFFACC1D);
  static var lightTheme = ThemeData(
      progressIndicatorTheme:
          const ProgressIndicatorThemeData(color: lightPrimaryColor),
      primaryColor: lightPrimaryColor,
      cardColor: Colors.white,
      hintColor: lightPrimaryColor,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(
          color: lightMainTextColor,
        ),
        color: Colors.transparent,
        titleTextStyle: TextStyle(
          color: lightMainTextColor,
          fontSize: 30.sp,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 0,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
      ),
      textTheme:  TextTheme(
        //ex.screen title
        titleLarge: TextStyle(
            color: lightMainTextColor,
            fontFamily: 'ElMessiri',
            fontSize: 20.sp,
            fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(
          color: lightMainTextColor,
          fontFamily: 'Inter',
          fontSize: 20.sp,
          fontWeight: FontWeight.normal,
        ),
        titleMedium: TextStyle(
            //ex.sub headers
            color: lightMainTextColor,
          fontFamily: 'ReemKufi',
          fontSize: 25.sp,
          fontWeight: FontWeight.normal),
        bodyMedium: TextStyle(
          color: lightMainTextColor,
          fontFamily: 'QuranFont',
          fontSize: 25.sp,
          fontWeight: FontWeight.w500,
        ),
        bodySmall: TextStyle(color: lightMainTextColor, fontSize: 20.sp),
      ),
      bottomSheetTheme:  const BottomSheetThemeData(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(12), topLeft: Radius.circular(12))),
      ));
  static var darkTheme = ThemeData(
      progressIndicatorTheme:  const ProgressIndicatorThemeData(
        color: darkAccentColor,
      ),
      primaryColor: darkPrimaryColor,
      cardColor: darkPrimaryColor,
      hintColor: darkAccentColor,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme:  AppBarTheme(
        iconTheme: const IconThemeData(
          color: darkMainTextColor,
        ),
        color: Colors.transparent,
        titleTextStyle: TextStyle(
          color: darkMainTextColor,
          fontSize: 30.sp,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      bottomNavigationBarTheme:  const BottomNavigationBarThemeData(
        elevation: 0,
        selectedItemColor: darkAccentColor,
        unselectedItemColor: Colors.white,
      ),
      textTheme:  TextTheme(
        //ex.screen title
        titleLarge: TextStyle(
          color: darkMainTextColor,
          fontFamily: 'ElMessiri',
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(
          color: darkMainTextColor,
          fontFamily: 'Inter',
          fontSize: 20.sp,
          fontWeight: FontWeight.normal,
        ),
        titleMedium: TextStyle(
            //ex.sub headers
            color: darkMainTextColor,
          fontFamily: 'ReemKufi',
          fontSize: 25.sp,
          fontWeight: FontWeight.normal,),
        bodyMedium: TextStyle(
            color: darkMainTextColor,
            fontFamily: 'QuranFont',
            fontSize: 21.sp,
            fontWeight: FontWeight.w500),
        bodySmall: TextStyle(color: darkMainTextColor, fontSize: 20.sp),
      ),
      bottomSheetTheme:  const BottomSheetThemeData(
        backgroundColor: darkPrimaryColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(12), topLeft: Radius.circular(12))),
      ));
  static ThemeMode themeMode = ThemeMode.dark;
}
