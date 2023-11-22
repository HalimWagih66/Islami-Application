import 'package:Islami/api%20manager/api_manager.dart';


class QuranTapViewModel{
  QuranTapViewModel(String languageCode){
    if(future != null) return;
    future = ApiManager.getNamesSurahs(languageCode);
  }
  dynamic future;
}
