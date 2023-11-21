import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsAppData{
  static late SharedPreferences settingsAppData;
  static Future<void>saveLanguageCode(String languageCode)async{
    await settingsAppData.setString("LanguageCode", languageCode);
  }
  static Future<void>savedStateThemeModeApp(ThemeMode them)async{
    await settingsAppData.setString("theme", them.name);
  }
  static String? getLanguageCode()  {

    return settingsAppData.getString("LanguageCode");
  }
  static String? getStateThemeModeApp()  {

    return settingsAppData.getString('theme');
  }
}