// import 'package:flutter/material.dart';
//
// class ss extends StatelessWidget {
//   const ss({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return RichText(
//       textAlign: widget.suraNumber >= 93 || widget.suraNumber == 0 || ayahs.length < 5 ? TextAlign.center : TextAlign.justify,
//       textDirection: TextDirection.rtl,
//       text: TextSpan(
//         children: [
//           for (var i = 0; i < ayahs.length; i++, ayatCounter++) ...{
//             if (ayahs[i].numberInSurah == 1) ...{
//               WidgetSpan(
//                   child: SizedBox(
//                     width: MediaQuery.of(context).size.height,
//                     child: Text(
//                         "بِسْمِ اللَّـهِ الرَّحْمَـٰنِ الرَّحِيمِ",
//                         textAlign: TextAlign.center,
//                         style: Theme.of(context)
//                             .textTheme
//                             .bodyMedium),
//                   ))
//             },
//             TextSpan(
//
//                 text: ' '
//                     "${ayahs[ayahs[i].numberInSurah == 1 ? i : i].text}"
//                     ' ',
//                 style:
//                 Theme.of(context).textTheme.bodyMedium),
//             WidgetSpan(
//
//                 alignment: PlaceholderAlignment.middle,
//                 child: GestureDetector(
//                   onLongPress: () async {
//                     if (isPlay) {
//                       audioPlayerAya.pause();
//                       isPlay = false;
//                     } else {
//                       String? audio =
//                       await ApiManager.getAyaAudio(
//                           widget.suraNumber,
//                           ayahs[i].numberInSurah ?? 1);
//                       await audioPlayerAya
//                           .play(UrlSource(audio ?? ""));
//                       isPlay = true;
//                     }
//                   },
//                   child: Directionality(
//                     textDirection: TextDirection.rtl,
//                     child: CircleAvatar(
//                       backgroundColor:
//                       Colors.grey.withOpacity(0.3),
//                       radius: 18,
//                       child: Text(
//                         ArabicNumbers.toArabicNumbers(ayahs[i]
//                             .numberInSurah
//                             .toString()),
//                         style: const TextStyle(
//                             color: Colors.black,
//                             fontSize: 19,
//                             fontWeight: FontWeight.w300),
//                         textAlign: TextAlign.center,
//                         textDirection: TextDirection.rtl,
//                         textScaleFactor:
//                         i.toString().length <= 2 ? 1 : .8,
//                       ),
//                     ),
//                   ),
//                 ))
//           }
//         ],
//       ),
//     );
//   }
// }
