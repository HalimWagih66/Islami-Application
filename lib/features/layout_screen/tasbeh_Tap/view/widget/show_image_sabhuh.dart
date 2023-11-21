import 'package:flutter/material.dart';
import 'package:islami_app/features/layout_screen/provider/settings_provider.dart';
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
              margin: EdgeInsets.only(left: widthScreen * 0.1),
              padding: EdgeInsets.only(bottom: heightScreen * 0.2),
              child: Image(
                  width: widthScreen * 0.2,
                  height: heightScreen * 0.2,
                  image: AssetImage(settingsProvider.getImageHeadSabhuh()))),
          Container(
            padding: EdgeInsets.only(top: heightScreen * 0.1),
            child: Transform.rotate(
              angle: tasbehProvider.angle,
              child: GestureDetector(
                onTap: () async {
                  await tasbehProvider.onTapClickButtonContentTasbeeh(context);
                },
                child: Image(
                    width: widthScreen * 0.7,
                    height: heightScreen * 0.7,
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
