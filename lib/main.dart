import 'package:Islami/provider/provider_about_surahs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Islami/shared/network/local/shared_preferences/quran_data.dart';
import 'package:Islami/shared/network/local/shared_preferences/radio_data.dart';
import 'package:Islami/shared/network/local/shared_preferences/settings_data.dart';
import 'package:Islami/shared/network/local/shared_preferences/tasbeh_data.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'provider/settings_provider.dart';
import 'features/layout_screen/radio_Tap/view model/radio_tap_view_model.dart';
import 'my_application.dart';

Future<void> main() async {
  runApp(
    MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (context) => RadioTapViewModel()),
        ChangeNotifierProvider(create: (context) => SurahsInfoProvider()),
        ChangeNotifierProvider(create: (context) => SettingsProvider()),
      ],
      child: const ScreenUtilInit(
          designSize: Size(412,873),
          minTextAdapt: true,
          splitScreenMode: true,
          child: MyApplication()
      ),
    ),
  );
  TasbehData.tasbehData = await SharedPreferences.getInstance();
  SettingsAppData.settingsAppData = await SharedPreferences.getInstance();
  QuranData.quranData = await SharedPreferences.getInstance();
  RadioData.radioData = await SharedPreferences.getInstance();

}

