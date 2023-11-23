import 'package:flutter/material.dart';
import 'package:Islami/provider/settings_provider.dart';
import 'package:Islami/features/layout_screen/tasbeh_Tap/view%20model/tasbeh_tap_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'child_bottom_content_tasbeh_ink_will.dart';

class ShowContentTasbeh extends StatelessWidget {
  const ShowContentTasbeh({super.key});
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TasbehTapViewModel>(context);
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Theme.of(context).hintColor,
      ),
      width: MediaQuery.of(context).size.height * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: const Color(0xFFFACC1D),
                    padding: EdgeInsets.symmetric(vertical: 50.h),
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
                    shadowColor: Colors.transparent,
                    backgroundColor: Colors.transparent
                ),
                onLongPress: () async {
                  await provider.onLongPressNextContentTasbeh();
                },
                onPressed: () async {
                  await provider.onTapPressNextContentTasbeh();
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
                await provider.onLongPressContentTasbeh(context);
              },
              child: const ChildBottomContentInkWil(),
            ),
          ),
          Expanded(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: const Color(0xFFFACC1D),
                    padding: EdgeInsets.symmetric(vertical: 50.h),
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
                    shadowColor: Colors.transparent,
                    backgroundColor: Colors.transparent
                ),
                onLongPress: ()async {
                  await provider.onLongBackContentTasbeh();
                },
                onPressed: () async {
                  await provider.onPressedBackContentTasbeh();
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
