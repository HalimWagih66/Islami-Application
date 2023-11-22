import 'package:flutter/material.dart';
import 'package:Islami/features/details_screen/quran/presentation/view/widget/page_of_the_quran.dart';
import '../../../../../../api manager/api_manager.dart';
import '../../../../../../models/model.page_of_mushaf/PageOfMushafResponse.dart';
import '../../../model/information_surah_model.dart';

class DetailsQuranViewBody extends StatelessWidget {
    DetailsQuranViewBody({super.key,
    required this.informationSurahModel});
   final InformationSurahModel informationSurahModel;
   PageOfMushafResponse? pageOfMushafResponse;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(5),
        child: FutureBuilder(
          future: ApiManager.getPageOfMushaf(informationSurahModel.startPage),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError || snapshot.data?.data?.ayahs?.isEmpty == true) {
              return const Center(
                  child: Text("something went wrong please try later"));
            }
            else if(snapshot.hasData){
              if(snapshot.data?.data?.ayahs?.isEmpty != false){
                return const Text("something went wrong please try later");
              }
              else{
                pageOfMushafResponse = snapshot.data;
                for(int i = pageOfMushafResponse!.data!.ayahs!.length-1;i >= 0;i--){
                  if(pageOfMushafResponse!.data!.ayahs![i].surahInfoInPage?.surahName.contains(informationSurahModel.surahNameTashkil) == false){
                    pageOfMushafResponse!.data!.ayahs?.removeAt(i);
                  }
                }
              }
              return PageOfTheQuran(
                informationSurahModel: informationSurahModel, pageOfMushafResponse: pageOfMushafResponse!,
              );
            }
            return const SizedBox();
          },
        ));
  }
}