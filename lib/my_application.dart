import 'package:flutter/material.dart';
import 'package:Islami/style/theme_data.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'features/details_screen/hadeth/details_hadeth.dart';
import 'features/details_screen/quran/presentation/view/details_quran.dart';
import 'features/details_screen/tasbeh/tasbeh_details.dart';
import 'features/layout_screen/layout_screen.dart';
import 'provider/settings_provider.dart';

class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        DetailsSurah.routeName: (context) => const DetailsSurah(),
        DetailsHadeth.routeName: (context) => const DetailsHadeth(),
        LayoutScreen.routeName: (context) => const LayoutScreen(),
        TasbehDetails.routeName: (context) => const TasbehDetails()
      },
      title: "Islami",
      initialRoute: LayoutScreen.routeName,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('ar'), // Arabic
      ],
      locale: Locale(provider.languageCode),
      themeMode: provider.themeMode,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
    );
  }
}