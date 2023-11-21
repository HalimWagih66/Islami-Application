import 'package:flutter/material.dart';
import 'package:islami_app/features/layout_screen/provider/settings_provider.dart';
import 'package:islami_app/features/layout_screen/tasbeh_Tap/view%20model/tasbeh_tap_view_model.dart';
import 'package:provider/provider.dart';

import '../../../../../shared/network/local/shared_preferences/settings_data.dart';
import 'child_ink_will.dart';

class ShowContentTasbeh extends StatelessWidget {
  const ShowContentTasbeh({super.key, required this.widthScreen});
  final double widthScreen;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TasbehTapViewModel>(context);
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Theme.of(context).hintColor,
      ),
      width: widthScreen * 0.9,
      child: Row(
        key: key,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: GestureDetector(
                onLongPress: () async {
                  await provider.onLongPressNextIconContentTasbeh();
                },
                onTap: () async {
                  await provider.onTapPressNextIconContentTasbeh();
                },
                child: Icon(
                  Icons.arrow_back,
                  color: settingsProvider.isDarkEnabled()
                      ? const Color(0xFF1A233F)
                      : const Color(0xF1F1F1FF),
                )),
          ),
          Expanded(
            flex: 6,
            child: InkWell(
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: ()async {
                await provider.onTapClickButtonContentTasbeeh(context);
              },
              onLongPress: ()async {
                await provider.onLongPressCounterTasbeh();
              },
              child: ChildInkWill(widthScreen: widthScreen),
            ),
          ),
          Expanded(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: const Color(0xFFFACC1D), padding: const EdgeInsets.symmetric(vertical: 40),
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
                    shadowColor: Colors.transparent,
                    backgroundColor: Colors.transparent
                ),
                onLongPress: ()async {
                  await provider.onLongBackIconContentTasbeh();
                },
                onPressed: () async {
                  await provider.onPressedBackIconContentTasbeh();
                },
                child: Icon(
                  Icons.arrow_forward_outlined,
                  color: settingsProvider.isDarkEnabled()
                      ? const Color(0xFF1A233F)
                      : const Color(0xF1F1F1FF),
                )),
          ),
        ],
      ),
    );
  }
}
