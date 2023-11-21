import 'package:flutter/material.dart';
import 'package:islami_app/features/layout_screen/tasbeh_Tap/view/widget/tasbeh_tap_body.dart';
import 'package:provider/provider.dart';
import '../view model/tasbeh_tap_view_model.dart';


class TasbehTap extends StatelessWidget {
  const TasbehTap({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TasbehTapViewModel(),
      child: SingleChildScrollView(
        child: TasbehTapBody(widthScreen:  MediaQuery.of(context).size.width,heightScreen: MediaQuery.of(context).size.width)
      ),
    );
  }
}
