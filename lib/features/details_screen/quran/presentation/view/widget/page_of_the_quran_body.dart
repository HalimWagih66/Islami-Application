import 'package:flutter/material.dart';
import 'package:islami_app/features/details_screen/quran/model/information_surah_model.dart';
import 'package:islami_app/models/model.page_of_mushaf/PageOfMushafResponse.dart';
import 'package:provider/provider.dart';
import '../../view model/details_quran_view_model.dart';
import 'book_mark.dart';
import 'number_aya_widget.dart';

class PageOfTheQuranBody extends StatelessWidget {
  PageOfTheQuranBody({super.key, required this.informationSurahModel, required this.pageOfMushafResponse});
  PageController pageController = PageController();
  final InformationSurahModel informationSurahModel;
  final PageOfMushafResponse pageOfMushafResponse;
  @override
  Widget build(BuildContext context) {
    var detailsQuranViewModel = Provider.of<DetailsQuranViewModel>(context);
    if(detailsQuranViewModel.ayahs.isEmpty){
      detailsQuranViewModel.ayahs = pageOfMushafResponse.data!.ayahs!;
    }
    return PageView.builder(
        controller: pageController,
        itemCount: (informationSurahModel.endPage - informationSurahModel.startPage) + 1,
        onPageChanged: (page) async {
          detailsQuranViewModel.initializeTheNextPage(informationSurahModel.startPage, page);
          pageController.animateToPage(page,
              duration: const Duration(seconds: 1), curve: Curves.easeInOut);
          if (page + informationSurahModel.startPage == informationSurahModel.endPage) {
            detailsQuranViewModel.filterSurahsAnotherInPage(informationSurahModel.surahNameTashkil);
          }
        },
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  BookMarkButton(currentPageNumber: informationSurahModel.startPage + index,currentSurahNumber: informationSurahModel.suraNumber),
                  RichText(textAlign: informationSurahModel.suraNumber >= 93 || informationSurahModel.suraNumber == 0 || detailsQuranViewModel.ayahs.length < 5 ? TextAlign.center : TextAlign.justify,
                    textDirection: TextDirection.rtl,
                    text: TextSpan(
                      children: [
                        for (var i = 0; i < detailsQuranViewModel.ayahs.length; i++) ...{
                          if (detailsQuranViewModel.ayahs[i].numberInSurah == 1) ...{
                            WidgetSpan(
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.height,
                                  child: Text(
                                      "بِسْمِ اللَّـهِ الرَّحْمَـٰنِ الرَّحِيمِ",
                                      textAlign: TextAlign.center,
                                      style:
                                      Theme.of(context).textTheme.bodyMedium),
                                ))
                          },
                          TextSpan(
                              text: ' '
                                  "${detailsQuranViewModel.ayahs[detailsQuranViewModel.ayahs[i].numberInSurah == 1 ? i : i].text}"
                                  ' ',
                              style: Theme.of(context).textTheme.bodyMedium),
                          numberAyaWidget(surahNumber: informationSurahModel.suraNumber,context: context,ayaNumber: detailsQuranViewModel.ayahs[i].numberInSurah ?? 1),
                        }
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
