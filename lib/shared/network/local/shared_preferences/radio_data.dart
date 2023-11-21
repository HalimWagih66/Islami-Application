import 'package:shared_preferences/shared_preferences.dart';

class RadioData{
  static late SharedPreferences radioData;
  static Future<void> saveNumberRadioStation(int value)async{
    await radioData.setInt("RadioStation", value);
  }
  static int? getNumberRadioStation(){
    return radioData.getInt("RadioStation");
  }
}