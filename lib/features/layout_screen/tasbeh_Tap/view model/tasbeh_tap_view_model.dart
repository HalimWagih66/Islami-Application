import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../shared/network/local/shared_preferences/tasbeh_data.dart';
import '../view/widget/show_bottom_sheet_tasbeh.dart';

class TasbehTapViewModel extends ChangeNotifier {
  List<String> contentTasbeh = [];
  List<String> rewardTasbeh = [];
  int counterNumberTasbeh = 0;
  int selectedContentTasbeh = 0;
  double angle = 0;
  Future<void> readFile() async {
    print("readFile");
    String chapterHadeth =
    await rootBundle.loadString("assets/files/tasbeh/tasbeh.txt");
    List<String> lines = chapterHadeth.split('\n');
    for (int i = 0, z = 0; i < lines.length; i += 2, z++) {
      contentTasbeh.add(lines[i]);
      rewardTasbeh.add(lines[i + 1]);
    }
    //return true;
  }

  Future<void> changeSelectedContentTasbeh(BuildContext context,int index) async {
    selectedContentTasbeh = index;
    counterNumberTasbeh = 0;
    await TasbehData.saveSelectedContentTasbeh(selectedContentTasbeh);
    await TasbehData.saveNumberTasbeh(counterNumberTasbeh);
    notifyListeners();
  }
  void getNumberTasbeh(){
    counterNumberTasbeh = TasbehData.getNumberTasbeh()??0;
  }
  void getSelectedContentTasbeh(){
    selectedContentTasbeh = TasbehData.getSelectedContentTasbeh()??0;
  }

  void showBottomSheetTasbeeh(BuildContext context,List<String> contentTasbeh, List<String> rewardTasbeh, Function callBackFunction,) {
    showModalBottomSheet(
        context: context,
        builder: (context) => ShowBottomSheetTasbeh(
            contentTasbeh: contentTasbeh,
            rewardTasbeh: rewardTasbeh,
            callBack: callBackFunction),
        isScrollControlled: true);
  }

  Future<void> onTapClickButtonContentTasbeeh(BuildContext context) async {
    counterNumberTasbeh++;
    if (counterNumberTasbeh == 32) {
      selectedContentTasbeh++;
      await TasbehData.saveSelectedContentTasbeh(selectedContentTasbeh);
      counterNumberTasbeh = 0;
    }
    await TasbehData.saveNumberTasbeh(counterNumberTasbeh);
    angle += 25;
    notifyListeners();
  }
  Future<void>onLongPressCounterTasbeh()async{
    counterNumberTasbeh = 0;
    await TasbehData.saveNumberTasbeh(counterNumberTasbeh);
    notifyListeners();
  }
  Future<void>onLongPressNextIconContentTasbeh()async{
    counterNumberTasbeh = 0;
    await TasbehData.saveNumberTasbeh(counterNumberTasbeh);
    notifyListeners();
  }
  Future<void>onTapPressNextIconContentTasbeh()async{
    if (selectedContentTasbeh < 18) {
      selectedContentTasbeh++;
      counterNumberTasbeh = 0;
      await TasbehData.saveSelectedContentTasbeh(selectedContentTasbeh);
      await TasbehData.saveNumberTasbeh(
          counterNumberTasbeh);
      notifyListeners();
    }
  }
  Future<void>onPressedBackIconContentTasbeh()async{
    if (selectedContentTasbeh >  0) {
      selectedContentTasbeh--;
      counterNumberTasbeh = 0;
      await TasbehData.saveSelectedContentTasbeh(selectedContentTasbeh);
      await TasbehData.saveNumberTasbeh(
          counterNumberTasbeh);
      notifyListeners();
    }
  }
  Future<void>onLongBackIconContentTasbeh()async{
    selectedContentTasbeh = 16;
    notifyListeners();
  }
}
