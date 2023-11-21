import 'package:flutter/material.dart';
import 'package:islami_app/features/layout_screen/hadeth_Tap/view/widget/show_image.dart';
import 'package:islami_app/features/layout_screen/hadeth_Tap/view/widget/show_names_hadiths.dart';
import 'package:islami_app/features/layout_screen/hadeth_Tap/view/widget/title_hadeth_tap.dart';
import 'package:provider/provider.dart';
import '../view model/hadeth_tap_view_model.dart';

class HadethTap extends StatelessWidget {
  const HadethTap({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HadethTapViewModel(),
      child: const CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                ShowImage(),
                TitleHadithTap(),
              ],
            ),

          ),
          ShowNamesHadiths(),
          // SliverFillRemaining(
          //   child: ShowNamesHadiths(),
          // )
        ],
      ),
    );
  }
}
