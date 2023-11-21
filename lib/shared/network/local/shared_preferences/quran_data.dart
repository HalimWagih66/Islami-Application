import 'package:shared_preferences/shared_preferences.dart';

class QuranData{
  static late SharedPreferences quranData;
  static Future<void>saveSelectedBookMark(
      {required int selectedSurah, required int selectedPage})async{
    await quranData.setInt("selectedSurahBookMark",selectedSurah);
    await quranData.setInt("selectedPageBookMark",selectedPage);
  }
  static int? getSelectedSurahBookMark(){
   return quranData.getInt("selectedSurahBookMark");
  }
  static int? getSelectedPageBookMark(){
    return quranData.getInt("selectedPageBookMark");
  }
}