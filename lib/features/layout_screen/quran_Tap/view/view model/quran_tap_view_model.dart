import 'package:islami_app/shared/network/local/shared_preferences/quran_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuranTapViewModel{
  QuranTapViewModel(){
    initializeQuranData();
  }
  initializeQuranData()async{
    QuranData.quranData = await SharedPreferences.getInstance();
  }
  int getSelectedSurahBookMark(){
    return QuranData.getSelectedSurahBookMark()??-1;
  }
}