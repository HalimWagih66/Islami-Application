import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../shared/network/local/shared_preferences/settings_data.dart';
import '../../../provider/settings_provider.dart';
import '../../view model/tasbeh_tap_view_model.dart';

class ChildInkWill extends StatelessWidget {
  const ChildInkWill({super.key, required this.widthScreen});
  final double widthScreen;
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
                  width: 2,
                  style: BorderStyle.solid),),),
          width: widthScreen * 0.7,
          padding: const EdgeInsets.all(13),
          child: Text(
            tasbehProvider.contentTasbeh[tasbehProvider.selectedContentTasbeh],
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                . titleLarge
                ?.copyWith(
              color: settingsProvider.isDarkEnabled()
                  ? const Color(0xFF1A233F)
                  : const Color(0xF1F1F1FF),
            ),
          ),
    );
  }
}
