import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:Islami/provider/settings_provider.dart';
import 'package:Islami/features/layout_screen/quran_Tap/view/quran_tap.dart';
import 'package:Islami/features/layout_screen/radio_Tap/view%20model/radio_tap_view_model.dart';
import 'package:Islami/features/layout_screen/radio_Tap/view/radio_tap.dart';
import 'package:Islami/features/layout_screen/settings/view/settings_tap.dart';
import 'package:Islami/features/layout_screen/tasbeh_Tap/view/tasbeh_tap.dart';
import 'package:provider/provider.dart';
import 'hadeth_Tap/view/hadeth_tap.dart';

class LayoutScreen extends StatefulWidget{
  static const routeName = "LayoutScreen";

  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int selectedItemIndex = 0;
  final List<Widget> taps = [
    const QuranTap(),
    const HadethTap(),
    const TasbehTap(),
    const RadioTap(),
    const SettingsTap(),
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    final List<String> title = [
      AppLocalizations.of(context)!.quran,
      AppLocalizations.of(context)!.hadeth,
      AppLocalizations.of(context)!.tasbeh,
      AppLocalizations.of(context)!.radio,
      AppLocalizations.of(context)!.settings
    ];
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(provider.getMainBackground()),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(title[selectedItemIndex]),
        ),
        body: taps[selectedItemIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedItemIndex,
          onTap: (index){
            selectedItemIndex = index;
            if(index != 3){
              Provider.of<RadioTapViewModel>(context,listen: false).changeTapNumber(index);
            }
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(backgroundColor: Theme.of(context).primaryColor,label: AppLocalizations.of(context)!.quran,icon: const ImageIcon(AssetImage("assets/images/layout screen/icons BottomNavigationBar/quran.png"),)),
            BottomNavigationBarItem(backgroundColor: Theme.of(context).primaryColor,label: AppLocalizations.of(context)!.hadeth,icon: const ImageIcon(AssetImage("assets/images/layout screen/icons BottomNavigationBar/hadeth.png"),)),
            BottomNavigationBarItem(backgroundColor: Theme.of(context).primaryColor,label: AppLocalizations.of(context)!.tasbeh,icon: const ImageIcon(AssetImage("assets/images/layout screen/icons BottomNavigationBar/sebha.png"),)),
            BottomNavigationBarItem(backgroundColor: Theme.of(context).primaryColor,label: AppLocalizations.of(context)!.radio,icon: const ImageIcon(AssetImage("assets/images/layout screen/icons BottomNavigationBar/radio.png"),)),
            BottomNavigationBarItem(backgroundColor: Theme.of(context).primaryColor,label: AppLocalizations.of(context)!.settings,icon: const Icon(Icons.settings)),
          ],
        ),
      ),
    );
  }
}