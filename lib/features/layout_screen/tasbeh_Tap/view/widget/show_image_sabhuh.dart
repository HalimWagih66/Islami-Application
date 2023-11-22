import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Islami/provider/settings_provider.dart';
import 'package:provider/provider.dart';

import '../../view model/tasbeh_tap_view_model.dart';

class ShowImageSabhuh extends StatelessWidget {
  const ShowImageSabhuh({super.key, required this.widthScreen, required this.heightScreen});
  final double widthScreen;
  final double heightScreen;
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context,listen: false);
    var tasbehProvider = Provider.of<TasbehTapViewModel>(context);
    return Center(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
              margin: EdgeInsets.only(left: 50.w),
              child: Image(
                  width: 73.w,
                  height:105.h,
                  image: AssetImage(settingsProvider.getImageHeadSabhuh(),),),),
          Container(
            padding: EdgeInsets.only(top: 80.h),
            child: Transform.rotate(
              angle: tasbehProvider.angle,
              child: GestureDetector(
                onTap: () async {
                  await tasbehProvider.onTapClickButtonContentTasbeeh(context);
                },
                child: Image(
                    width: 232.w,
                    height: 234.h,
                    image: AssetImage(
                      settingsProvider.getImageBodySabhuh()),
                    )),
              ),
            ),
        ],
      ),
    );
  }
}
