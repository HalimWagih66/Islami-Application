import 'package:flutter/material.dart';
import 'package:islami_app/api%20manager/api_manager.dart';
import 'package:islami_app/features/layout_screen/quran_Tap/view/view%20model/quran_tap_view_model.dart';
import 'package:islami_app/features/layout_screen/quran_Tap/view/widget/quran_tap_body.dart';
import 'package:islami_app/features/layout_screen/quran_Tap/view/widget/surah_name_and_number_of_verses.dart';
import 'package:islami_app/features/layout_screen/quran_Tap/view/widget/title_table_surahs.dart';
import 'package:provider/provider.dart';
import '../../provider/settings_provider.dart';

class QuranTap extends StatelessWidget {
  const QuranTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) =>QuranTapViewModel(),
      child: Column(
        children: [
          const Expanded(
            flex: 1,
            child: Image(
              image: AssetImage(
                  "assets/images/layout screen/quran_tap/quran_header_logo.png"),
            ),
          ),
          const TitleTableSurahs(),
          QuranTapBody(),
        ],
      ),
    );
  }
}
