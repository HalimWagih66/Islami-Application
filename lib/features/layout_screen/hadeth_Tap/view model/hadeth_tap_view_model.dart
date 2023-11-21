import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../../../../models/models.hadeth/hadeth.dart';

class HadethTapViewModel extends ChangeNotifier{
  List<Hadith> listHadeth = [];
  Future<List<Hadith>> reaFile()async{
    String chapterContent = await rootBundle.loadString("assets/files/hadeth/ahadeth.txt");
    List<String>separatedHadith = chapterContent.split("#");
    for(int i = 0 ;i < separatedHadith.length;i++){
      List<String>lines = separatedHadith[i].trim().split('\n');
      String title = lines[0];
      lines.removeAt(0);
      Hadith hadeth = Hadith(title: title,contentHadeth: lines);
      listHadeth.add(hadeth);
    }
    return listHadeth;
  }
}