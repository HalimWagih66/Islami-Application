import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:islami_app/shared/network/local/shared_preferences/radio_data.dart';

class RadioProvider extends ChangeNotifier{
  late int selectedTapNumber;
  final radioPlayer = AudioPlayer();
  int selectedRadioStation = 0;
  late bool isPlay = false;
  void changeTapNumber(int tapNumber)async{
    if(tapNumber != 3 && isPlay){
      await radioPlayer.pause();
      isPlay = false;
      notifyListeners();
    }
  }
  Future<void> onClickPlayRadio(String url)async{
    isPlay = true;
    await radioPlayer.play(UrlSource(url));
  }
  Future<void> onClickPauseRadio()async{
    isPlay = false;
    await radioPlayer.pause();
  }
   Future<void> saveSelectedRadioStation(int value)async{
    selectedRadioStation = value;
    await RadioData.saveNumberRadioStation(value);
  }
}