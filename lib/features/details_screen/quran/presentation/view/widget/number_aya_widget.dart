import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:Islami/provider/settings_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../../to_arabic_no_covertor.dart';
import '../../view model/details_quran_view_model.dart';

TextSpan numberAyaWidget(
    {required BuildContext context, required int surahNumber, required int ayaNumber}){
  var detailsQuranViewModel = Provider.of<DetailsQuranViewModel>(context);
  var settingsProvider = Provider.of<SettingsProvider>(context,listen: false);
  return TextSpan(

    text: " ${settingsProvider.isLanguageEnglish()?" ﴿ ${ayaNumber.toString()} ﴾ ":ArabicNumbers.toArabicNumbers(
      ayaNumber.toString())} ",
  style: TextStyle(
    shadows: const [
    Shadow(
    blurRadius: 7.0,
    color: Colors.grey,
    offset: Offset(6, 5),
    ),
      ],
    decorationStyle: TextDecorationStyle.solid,
    fontFamily: "UthmanicHafs",
    fontSize: 23,
    //fontWeight: FontWeight.w500,
    color: settingsProvider.isDarkEnabled()?Colors.white:Colors.black,
  ),
    recognizer: LongPressGestureRecognizer()..onLongPress = () async {
    await detailsQuranViewModel.playAudioAya(surahNumber: surahNumber, ayaNumber: ayaNumber);
  },
    // GestureDetector(
    //   onLongPress: () async {
    //     await detailsQuranViewModel.playAudioAya(surahNumber: surahNumber, ayaNumber: ayaNumber);
    //   },
    //   child: CircleAvatar(
    //     backgroundColor: Colors.grey.withOpacity(0.3),
    //     radius: 16,
    //     child: Text(
    //       settingsProvider.isLanguageEnglish()?ayaNumber.toString():ArabicNumbers.toArabicNumbers(
    //           ayaNumber.toString()),
    //       style: TextStyle(
    //           color: settingsProvider.isDarkEnabled()?Colors.white:Colors.black,
    //           fontSize: 19,
    //           fontWeight: FontWeight.w300),
    //       textAlign: TextAlign.center,
    //       textDirection: TextDirection.rtl,
    //     ),
    //   ),
    // ),
  );
}