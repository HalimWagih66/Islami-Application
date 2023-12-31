import 'package:flutter/material.dart';
import 'package:Islami/features/details_screen/quran/presentation/view/widget/page_of_the_quran_body.dart';
import 'package:provider/provider.dart';
import '../../../../../../models/model.page_of_mushaf/PageOfMushafResponse.dart';
import '../../../model/information_surah_model.dart';
import '../../view model/details_quran_view_model.dart';

class PageOfTheQuran extends StatelessWidget {
  final PageOfMushafResponse pageOfMushafResponse;
  final InformationSurahModel informationSurahModel;


  const PageOfTheQuran({super.key, required this.informationSurahModel, required this.pageOfMushafResponse});

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => DetailsQuranViewModel(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: PageOfTheQuranBody(
          informationSurahModel: informationSurahModel,pageOfMushafResponse: pageOfMushafResponse,)
      ),
    );
  }
}
