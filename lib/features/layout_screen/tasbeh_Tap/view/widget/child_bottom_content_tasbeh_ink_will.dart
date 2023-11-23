import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../../shared/network/local/shared_preferences/settings_data.dart';
import '../../../../../provider/settings_provider.dart';
import '../../view model/tasbeh_tap_view_model.dart';

class ChildBottomContentInkWil extends StatelessWidget {
  const ChildBottomContentInkWil({super.key});
  @override
  Widget build(BuildContext context) {
    var tasbehProvider = Provider.of<TasbehTapViewModel>(context);
    tasbehProvider.getSelectedContentTasbeh();
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
          decoration: BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(
                  color:settingsProvider.isDarkEnabled()
                      ? const Color(0xFF1A233F)
                      : const Color(0xF1F1F1FF),
                  width: 2.w,
                  style: BorderStyle.solid),),),
      padding: const EdgeInsets.all(13),
          child: Text(
            tasbehProvider.contentTasbeh[tasbehProvider.selectedContentTasbeh],
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                . titleLarge
                ?.copyWith(
              fontSize: 22,
              color: settingsProvider.isDarkEnabled()
                  ? const Color(0xFF1A233F)
                  : const Color(0xF1F1F1FF),
            ),
          ),
    );
  }
}
