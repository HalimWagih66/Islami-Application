import 'package:flutter/material.dart';
import 'package:islami_app/shared/network/local/shared_preferences/quran_data.dart';
import 'package:islami_app/shared/network/local/shared_preferences/radio_data.dart';
import 'package:islami_app/shared/network/local/shared_preferences/settings_data.dart';
import 'package:islami_app/shared/network/local/shared_preferences/tasbeh_data.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/details_screen/quran/presentation/view model/details_quran_view_model.dart';
import 'features/layout_screen/provider/settings_provider.dart';
import 'features/layout_screen/radio_Tap/view model/radio_tap_view_model.dart';
import 'my_application.dart';

Future<void> main() async {
  runApp(
    MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (context) => RadioTapViewModel()),
        ChangeNotifierProvider(create: (context) => DetailsQuranViewModel()),
        ChangeNotifierProvider(create: (context) => SettingsProvider()),
      ],
      child: const MyApplication(),
    ),
  );
  RadioData.radioData = await SharedPreferences.getInstance();
  TasbehData.tasbehData = await SharedPreferences.getInstance();
  SettingsAppData.settingsAppData = await SharedPreferences.getInstance();
  QuranData.quranData = await SharedPreferences.getInstance();
}

