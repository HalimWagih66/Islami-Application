import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api manager/api_manager.dart';
import '../models/model.names_surahs/suwar.dart';
import '../shared/network/local/shared_preferences/quran_data.dart';

class SurahsInfoProvider extends ChangeNotifier{
  dynamic surahsNameFeature;
  int? selectedSurahBookMark;
  SurahsInfoProvider(){
    initializeQuranData();
  }
  initializeQuranData()async{
    QuranData.quranData = await SharedPreferences.getInstance();
    selectedSurahBookMark = QuranData.getSelectedSurahBookMark()??-1;
  }
  Future<List<Surah>?> initializeSurahsName(String languageCode)async{
    surahsNameFeature ??= await ApiManager.getNamesSurahs(languageCode);
    return surahsNameFeature;
  }
  Future<void>changeBookMark(int surahNumber,int pageNumber)async{
    await QuranData.saveSelectedBookMark(selectedPage: pageNumber,selectedSurah: surahNumber);
    notifyListeners();
  }
  int getSelectedSurahBookMark(){
    return QuranData.getSelectedSurahBookMark()??-1;
  }
  bool checkPageBookMark({required int currentSurahNumber,required int currentPageNumber}){
    if(currentSurahNumber == QuranData.getSelectedSurahBookMark() && currentPageNumber ==QuranData.getSelectedPageBookMark()){
      return true;
    }
    return false;
  }
}