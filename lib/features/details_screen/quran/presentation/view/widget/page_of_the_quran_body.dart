
import 'package:flutter/material.dart';
import 'package:Islami/features/details_screen/quran/model/information_surah_model.dart';
import 'package:Islami/models/model.page_of_mushaf/PageOfMushafResponse.dart';
import 'package:provider/provider.dart';
import '../../view model/details_quran_view_model.dart';
import 'book_mark.dart';
import 'number_aya_widget.dart';

class PageOfTheQuranBody extends StatefulWidget {
  const PageOfTheQuranBody(
      {super.key,
      required this.informationSurahModel,
      required this.pageOfMushafResponse});

  final InformationSurahModel informationSurahModel;
  final PageOfMushafResponse pageOfMushafResponse;

  @override
  State<PageOfTheQuranBody> createState() => _PageOfTheQuranBodyState();
}

class _PageOfTheQuranBodyState extends State<PageOfTheQuranBody> {
  PageController pageController = PageController();

  @override
  void initState() {
    Provider.of<DetailsQuranViewModel>(context, listen: false).ayahs.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var detailsQuranViewModel = Provider.of<DetailsQuranViewModel>(context);
    if (detailsQuranViewModel.ayahs.isEmpty) {
      detailsQuranViewModel.ayahs = widget.pageOfMushafResponse.data!.ayahs!;
      removeTextBismillah(1);
    }
    return PageView.builder(
        controller: pageController,
        itemCount: (widget.informationSurahModel.endPage -
                widget.informationSurahModel.startPage) +
            1,
        onPageChanged: (page) async {
          await detailsQuranViewModel.initializeTheNextPage(widget.informationSurahModel.startPage, page);
          pageController.animateToPage(page, duration: const Duration(seconds: 1), curve: Curves.easeInOut);
          removeSurahsAnotherInPage(page);
          removeTextBismillah(page+1);
        },
        itemBuilder: (BuildContext context, int index) {
          return CustomScrollView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: BookMarkButton(
                      currentPageNumber:
                      widget.informationSurahModel.startPage + index,
                      currentSurahNumber:
                      widget.informationSurahModel.suraNumber),
                ),
              ),
              SliverToBoxAdapter(
                child: RichText(
                  textAlign: widget.informationSurahModel.suraNumber >= 93 || widget.informationSurahModel.suraNumber == 0
                      ? TextAlign.center
                      : TextAlign.justify,
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
                                    style: Theme.of(context).textTheme.bodyMedium),
                              ))
                        },
                        TextSpan(
                            text: ' '
                                "${detailsQuranViewModel.ayahs[detailsQuranViewModel.ayahs[i].numberInSurah == 1 ? i : i].text}"
                                ' ',
                            style: Theme.of(context).textTheme.bodyMedium),
                        numberAyaWidget(
                            surahNumber:
                            widget.informationSurahModel.suraNumber,
                            context: context,
                            ayaNumber:
                            detailsQuranViewModel.ayahs[i].numberInSurah ??
                                1),
                      }
                    ],
                  ),
                ),
              ),
                SliverFillRemaining(
                  fillOverscroll: false,
                  hasScrollBody: false,
                  child:Align(
                    alignment: Alignment.bottomCenter,
                      child: Text(
                          "${widget.informationSurahModel.startPage + index}",
                          textAlign: TextAlign.end,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontSize: 20))),
                )
            ],
          );
        });
  }
  void removeTextBismillah(int page){
    if(page == 1){
      if(widget.informationSurahModel.suraNumber == 0){
        Provider.of<DetailsQuranViewModel>(context,listen: false).ayahs[0].text = "";
      }else if(widget.informationSurahModel.suraNumber != 9){
        Provider.of<DetailsQuranViewModel>(context,listen: false).ayahs[0].text  =  Provider.of<DetailsQuranViewModel>(context,listen: false).ayahs[0].text?.substring(39);
      }
    }
  }
  void removeSurahsAnotherInPage(int page){
    if (page + widget.informationSurahModel.startPage == widget.informationSurahModel.endPage) {
      Provider.of<DetailsQuranViewModel>(context,listen: false).filterSurahsAnotherInPage(
          widget.informationSurahModel.surahNameTashkil);
    }
    if (page == 0) {
      Provider.of<DetailsQuranViewModel>(context,listen: false).filterSurahsAnotherInPage(
          widget.informationSurahModel.surahNameTashkil);
    }
  }
}
