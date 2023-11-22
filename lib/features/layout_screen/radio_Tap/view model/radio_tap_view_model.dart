import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../shared/network/local/shared_preferences/radio_data.dart';

class RadioTapViewModel extends ChangeNotifier {
  late int selectedTapNumber;
  final radioPlayer = AudioPlayer();
  int selectedRadioStation = 0;
  late bool isPlay = false;
  RadioTapViewModel(){
    initializeSelectedRadioStation();
  }
  initializeSelectedRadioStation()async{
    RadioData.radioData = await SharedPreferences.getInstance();
    selectedRadioStation = RadioData.getNumberRadioStation()??0;
  }
  void changeTapNumber(int tapNumber) async {
    if (tapNumber != 3 && isPlay) {
      await radioPlayer.pause();
      isPlay = false;
      notifyListeners();
    }
  }

  Future<void> onClickPlayRadio(String url) async {
    isPlay = true;
    await radioPlayer.play(UrlSource(url));
  }

  Future<void> onClickPauseRadio() async {
    isPlay = false;
    await radioPlayer.pause();
  }
  // void initializeSelectedRadioStation() {
  //   RadioData.getNumberRadioStation();
  // }
  Future<void> saveSelectedRadioStation(int value) async {
    selectedRadioStation = value;
    await RadioData.saveNumberRadioStation(value);
  }

  Future<void> onPressedFormerRadioStation(String radioUrl) async {
    if (selectedRadioStation == 0) return;
    if (isPlay) {
      await RadioData.saveNumberRadioStation(selectedRadioStation--);
      await radioPlayer.stop();
      await onClickPlayRadio(radioUrl);
    } else {
      await RadioData.saveNumberRadioStation(selectedRadioStation--);
    }
    notifyListeners();
  }
  Future<void> onPressedNextRadioStation(String radioUrl) async {
    if (isPlay) {
      await RadioData.saveNumberRadioStation(selectedRadioStation++);
      await radioPlayer.stop();
      await onClickPlayRadio(radioUrl);
    } else {
      await RadioData.saveNumberRadioStation(selectedRadioStation++);
    }
    notifyListeners();
  }

  Future<void> onPressedPlayAndPauseRadioStation(String radioUrl) async {
    if (isPlay) {
      await onClickPauseRadio();
    } else {
      await onClickPlayRadio(radioUrl);
    }
    notifyListeners();
  }

}