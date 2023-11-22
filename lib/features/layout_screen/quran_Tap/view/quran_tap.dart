
import 'package:flutter/material.dart';
import 'package:Islami/features/layout_screen/quran_Tap/view/widget/quran_tap_body.dart';
import 'package:Islami/features/layout_screen/quran_Tap/view/widget/title_table_surahs.dart';

class QuranTap extends StatelessWidget {
  const QuranTap({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Column(
      children: [
        Expanded(
          flex: 1,
          child: Image(
            image: AssetImage(
                "assets/images/layout screen/quran_tap/quran_header_logo.png"),
          ),
        ),
        TitleTableSurahs(),
        QuranTapBody(),
      ],
    );
  }
}
