import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Islami/features/layout_screen/settings/view/widget/field_choose_app_state.dart';
import 'package:provider/provider.dart';
import '../../../../provider/settings_provider.dart';
import 'widget/custom_bottom_sheet.dart';

class SettingsTap extends StatelessWidget {
  const SettingsTap({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.theme,
              style: Theme.of(context).textTheme.titleLarge),
          SizedBox(
            height: 12.h,
          ),
          InkWell(
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () {
              showThemeBottomSheet(context);
            },
            child: FieldChooseAppState(text: provider.isDarkEnabled() ? AppLocalizations.of(context)!.dark : AppLocalizations.of(context)!.light),
          ),
          SizedBox(
            height: 30.h,
          ),
          Text(AppLocalizations.of(context)!.language,
              style: Theme.of(context).textTheme.titleMedium),
          SizedBox(
            height: 20.h,
          ),
          InkWell(
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () {
              showLanguageBottomSheet(context);
            },
            child: FieldChooseAppState(text: provider.isLanguageEnglish() ? "English" : "العربيه"),
          ),
        ],
      ),
    );
  }

  void showThemeBottomSheet(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context,listen: false);
    showModalBottomSheet(
        context: context, builder: (context) => CustomBottomSheet(typeBottomSheet: "theme",textButtonTheFirst: AppLocalizations.of(context)!.light, textButtonTheSecond: AppLocalizations.of(context)!.dark,background: provider.isDarkEnabled()?const Color(0xff414d7c):const Color(0x51eacc92), executeMethodButtonTheFirst: provider.enableLightMode, executeMethodButtonTheSecond: provider.enableDarkMode));
  }

  void showLanguageBottomSheet(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context,listen: false);
    showModalBottomSheet(
      context: context,
      builder: (context) =>  CustomBottomSheet(typeBottomSheet: "language",textButtonTheFirst: "English", textButtonTheSecond: 'العربية',background: provider.isDarkEnabled()?const Color(0xff414d7c):const Color(0x51eacc92), executeMethodButtonTheFirst: provider.enableLanguageEnglish, executeMethodButtonTheSecond: provider.enableLanguageArabic),
    );
  }
}
