import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../shared/network/local/shared_preferences/settings_data.dart';
class SettingsProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  String _languageCode = "en";
  SettingsProvider() {
    initializeValues();
  }
  ThemeMode get themeMode => _themeMode;

  set themeMode(ThemeMode value) {
    _themeMode = value;
  }
  bool isDarkEnabled(){
    return _themeMode == ThemeMode.dark;
  }
  initializeValues()async{
     SettingsAppData.settingsAppData = await SharedPreferences.getInstance();
     _themeMode = SettingsAppData.getStateThemeModeApp() == "dark"?ThemeMode.dark:ThemeMode.light;
     _languageCode = SettingsAppData.getLanguageCode() ?? "en";
     notifyListeners();

  }
  bool isLanguageEnglish(){
    return _languageCode == "en";
  }
  void enableLanguageArabic()async{
    languageCode = "ar";
    await SettingsAppData.saveLanguageCode(languageCode);
    notifyListeners();
  }
  void enableLanguageEnglish()async{
    languageCode = "en";
    await SettingsAppData.saveLanguageCode(languageCode);
    notifyListeners();
  }
  void enableDarkMode() async{
    themeMode = ThemeMode.dark;
    await SettingsAppData.savedStateThemeModeApp(themeMode);
    notifyListeners();
  }
  void enableLightMode()async {
    themeMode = ThemeMode.light;
    await SettingsAppData.savedStateThemeModeApp(themeMode);
    notifyListeners();
  }
  String getMainBackground() {
    return themeMode == ThemeMode.dark
        ? "assets/images/layout screen/background_main/dark/background_layout_screen_dark.png"
        : "assets/images/layout screen/background_main/light/background_layout_screen_light.png";
  }
  String getImageHeadSabhuh() {
    return themeMode == ThemeMode.dark
        ? "assets/images/layout screen/Tasbeh_tap/dark/head of seb7a.png"
        : "assets/images/layout screen/Tasbeh_tap/light/head of seb7a.png";
  }
  String getImageBodySabhuh() {
    return themeMode == ThemeMode.dark
        ? "assets/images/layout screen/Tasbeh_tap/dark/body of seb7a.png"
        : "assets/images/layout screen/Tasbeh_tap/light/body of seb7a.png";
  }
  String get languageCode => _languageCode;

  set languageCode(String value) {
    _languageCode = value;
  }
}
