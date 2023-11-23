import 'package:flutter/material.dart';
import 'package:Islami/features/layout_screen/tasbeh_Tap/view/widget/tasbeh_tap_body.dart';
import 'package:provider/provider.dart';
import '../view model/tasbeh_tap_view_model.dart';


class TasbehTap extends StatelessWidget {
  const TasbehTap({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TasbehTapViewModel(),
      child: const SingleChildScrollView(
        child: TasbehTapBody()
      ),
    );
  }
}
