import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:islami_app/models/model.page_of_mushaf/PageOfMushafResponse.dart';
import 'package:islami_app/shared/network/local/shared_preferences/quran_data.dart';

import '../../../../../api manager/api_manager.dart';
import '../../../../../models/model.page_of_mushaf/ayahs.dart';


class DetailsQuranViewModel extends ChangeNotifier {
  bool isPlay = false;
  List<Ayahs> ayahs = [];
  PageController pageController = PageController();
  AudioPlayer audioPlayerAya = AudioPlayer();
  int ayatCounter = 0;
  int counter = 0;
  Future<void>changeBookMark(int surahNumber,int pageNumber)async{
    await QuranData.saveSelectedBookMark(selectedPage: pageNumber,selectedSurah: surahNumber);
    notifyListeners();
  }
  int getSelectedSurahBookMark(){
    return QuranData.getSelectedSurahBookMark()??-1;
  }
  Future<void> initializeTheNextPage(int startPage,int currentPage) async {
    PageOfMushafResponse pageOfMushafResponse = await ApiManager.getPageOfMushaf(startPage + currentPage)..data?.ayahs;
    ayahs = pageOfMushafResponse.data?.ayahs ?? [];
    notifyListeners();
  }
  void filterSurahsAnotherInPage(String surahNameTashkil){
      for (int i = ayahs!.length - 1; i >= 0; i--) {
        if (ayahs![i]
            .surahInfoInPage
            ?.surahName
            .contains(surahNameTashkil) ==
            false) {
          ayahs?.removeAt(i);
        }
      }
  }
  bool checkPageBookMark({required int currentSurahNumber,required int currentPageNumber}){
    if(currentSurahNumber == QuranData.getSelectedSurahBookMark() && currentPageNumber ==QuranData.getSelectedPageBookMark()){
      return true;
    }
    return false;
  }
  Future<void>playAudioAya({required int surahNumber,required int ayaNumber})async{
    if (isPlay) {
      audioPlayerAya.pause();
      //ayahs[ayaNumber].numberInSurah ?? 1
      isPlay = false;
    } else {
      String? audio = await ApiManager.getAyaAudio(surahNumber,ayaNumber);
      await audioPlayerAya.play(UrlSource(audio ?? ""));
      isPlay = true;
    }
  }
}