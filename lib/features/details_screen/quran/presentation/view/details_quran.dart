import 'package:Islami/style/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:Islami/features/details_screen/quran/presentation/view/widget/details_quran_view_body.dart';
import 'package:provider/provider.dart';
import '../../../../../models/models.quran/details_sura_arguments.dart';
import '../../../../../provider/settings_provider.dart';
import '../../model/information_surah_model.dart';

class DetailsSurah extends StatelessWidget {
  static const routeName = "DetailsSura";
   const DetailsSurah({super.key});
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    var arg = ModalRoute.of(context)?.settings.arguments as DetailsSuraArg;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(provider.getMainBackground()),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: Text(arg.surahName),
        ),
        body: Card(
          margin: const EdgeInsets.all(10),
          elevation: 15,
          color: provider.isDarkEnabled() == true ? MyThemeData.darkPrimaryColor:Colors.white,
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
                style: BorderStyle.solid, width: 1, color: Colors.transparent),
          ),
          child: DetailsQuranViewBody(
            informationSurahModel: InformationSurahModel(
              surahName: arg.surahName,
              suraNumber: arg.suraNumber,
              startPage: arg.startPage,
              endPage: arg.endPage,
              numberOfVerses: arg.numberOfVerses,
              surahNameTashkil: arg.surahNameTashkil,
            ),
          )
        ),
      ),
    );
  }
}
