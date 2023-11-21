import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../models/models.quran/details_sura_arguments.dart';
import '../../../../details_screen/quran/presentation/view/details_quran.dart';
import '../../../provider/settings_provider.dart';

class SurahNameAndNumberOfVerses extends StatelessWidget {
  final int endPage;
  final int suraNumber;
  final bool isSelectedSurahBookMark;
  final String surahName;
  final String surahNameTashkil;
  final int startPage;
  final int numberOfVerses;
  const SurahNameAndNumberOfVerses({super.key, required this.numberOfVerses, required this.endPage, required this.startPage, required this.suraNumber, required this.surahNameTashkil, required this.surahName, required this.isSelectedSurahBookMark});
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return InkWell(
      onTap: ()async{
        Navigator.pushNamed(
            context,
            DetailsSurah.routeName,
            arguments: DetailsSuraArg(surahNameTashkil: surahNameTashkil,surahName: settingsProvider.languageCode == "en"?surahName:surahNameTashkil,suraNumber: suraNumber,startPage: startPage,endPage: endPage, numberOfVerses: numberOfVerses),
        );
      },
      child: Table(
        children: [
          TableRow(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Theme.of(context).hintColor,style: BorderStyle.solid,width: 2))
            ),
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: Text(
                    numberOfVerses.toString(),
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
                height: MediaQuery.of(context).size.height * 0.075,
                child: VerticalDivider(
                  color: Theme.of(context).hintColor,
                  thickness: 2,
                  //width: 1,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 9),
                child: Stack(
                  children: [
                    isSelectedSurahBookMark?Transform.translate(offset: settingsProvider.isLanguageEnglish()?const Offset(-60,0):const Offset(60,0),
                    child: const Icon(Icons.bookmark,color: Colors.red,size: 40)):const SizedBox(),
                    Text(
                      settingsProvider.languageCode == "en"?surahName:surahNameTashkil,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize:23),
                      textAlign: TextAlign.center,

                    ),
                  ],
                ),
              ),
            ]
          )
        ],
      ),
    );
  }
}
