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
    if(contentTasbeh.isEmpty){
      String chapterHadeth = await rootBundle.loadString("assets/files/tasbeh/tasbeh.txt");
      List<String> lines = chapterHadeth.split('\n');
      for (int i = 0; i < lines.length; i += 2) {
        contentTasbeh.add(lines[i]);
        rewardTasbeh.add(lines[i + 1]);
      }
    }
  }

  Future<void> changeSelectedContentTasbeh(BuildContext context,int index) async {
    selectedContentTasbeh = index;
    counterNumberTasbeh = 0;
    await TasbehData.saveSelectedContentTasbeh(selectedContentTasbeh);
    await TasbehData.saveNumberTasbeh(counterNumberTasbeh);
    notifyListeners();
    Navigator.pop(context);
  }
  void getNumberTasbeh(){
    counterNumberTasbeh = TasbehData.getNumberTasbeh()??0;
  }
  void getSelectedContentTasbeh(){
    selectedContentTasbeh = TasbehData.getSelectedContentTasbeh()??0;
  }

  void showBottomSheetTasbeeh(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => ShowBottomSheetTasbeh(
            contentTasbeh: contentTasbeh,
            rewardTasbeh: rewardTasbeh,
            callBack: changeSelectedContentTasbeh),
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
  Future<void>onLongPressContentTasbeh(BuildContext context)async{
   // await readFile();
    showBottomSheetTasbeeh(context);
    notifyListeners();
  }
  Future<void>onLongPressCounterTasbeh()async{
    counterNumberTasbeh = 0;
    await TasbehData.saveNumberTasbeh(counterNumberTasbeh);
    notifyListeners();
  }

  Future<void>onTapPressNextContentTasbeh()async{
    if (selectedContentTasbeh < 16) {
      selectedContentTasbeh++;
      counterNumberTasbeh = 0;
      await TasbehData.saveSelectedContentTasbeh(selectedContentTasbeh);
      await TasbehData.saveNumberTasbeh(counterNumberTasbeh);
      notifyListeners();
    }
  }
  Future<void>onPressedBackContentTasbeh()async{
    if (selectedContentTasbeh >  0) {
      selectedContentTasbeh--;
      counterNumberTasbeh = 0;
      await TasbehData.saveSelectedContentTasbeh(selectedContentTasbeh);
      await TasbehData.saveNumberTasbeh(counterNumberTasbeh);
      notifyListeners();
    }
  }
  Future<void>onLongBackContentTasbeh()async{
    selectedContentTasbeh = 0;
    counterNumberTasbeh = 0;
    await TasbehData.saveNumberTasbeh(counterNumberTasbeh);
    await TasbehData.saveSelectedContentTasbeh(selectedContentTasbeh);
    notifyListeners();
  }
  Future<void>onLongPressNextContentTasbeh()async{
    selectedContentTasbeh = 16;
    counterNumberTasbeh = 0;
    await TasbehData.saveNumberTasbeh(counterNumberTasbeh);
    await TasbehData.saveSelectedContentTasbeh(selectedContentTasbeh);
    notifyListeners();
  }
}
