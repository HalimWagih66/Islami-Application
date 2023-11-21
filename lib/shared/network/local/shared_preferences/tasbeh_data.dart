import 'package:shared_preferences/shared_preferences.dart';

class TasbehData{
  static late SharedPreferences tasbehData;
  static Future<void> saveSelectedContentTasbeh(int selectedContentTasbeh)async{
    await tasbehData.setInt( "selectedContentTasbeh", selectedContentTasbeh);
  }
  static int? getSelectedContentTasbeh(){
    return tasbehData.getInt("selectedContentTasbeh");
  }
  static Future<void> saveNumberTasbeh(int number)async{
    await tasbehData.setInt("NumberTasbeh", number);
  }
  static int? getNumberTasbeh() {
    return tasbehData.getInt("NumberTasbeh");
  }
}