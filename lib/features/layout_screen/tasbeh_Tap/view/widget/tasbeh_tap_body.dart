import 'package:flutter/material.dart';
import 'package:islami_app/features/layout_screen/tasbeh_Tap/view/widget/show_content_tasbeh.dart';
import 'package:islami_app/features/layout_screen/tasbeh_Tap/view/widget/show_counter_tasbeh.dart';
import 'package:islami_app/features/layout_screen/tasbeh_Tap/view/widget/show_image_sabhuh.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../view model/tasbeh_tap_view_model.dart';

class TasbehTapBody extends StatefulWidget {
  const TasbehTapBody({super.key, required this.heightScreen, required this.widthScreen});
  final double heightScreen;
  final double widthScreen;

  @override
  State<TasbehTapBody> createState() => _TasbehTapBodyState();
}

class _TasbehTapBodyState extends State<TasbehTapBody> {
  var future;
  @override
  void initState() {
    future = Provider.of<TasbehTapViewModel>(context,listen: false).readFile();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ShowImageSabhuh(heightScreen: widget.heightScreen, widthScreen: widget.widthScreen),
        SizedBox(
          height: widget.heightScreen * 0.05,
        ),
        Text(AppLocalizations.of(context)!.number_of_praises, style: Theme.of(context).textTheme.titleLarge,),
        SizedBox(
          height: widget.heightScreen * 0.03,
        ),
        const ShowCounterTasbeh(),
        SizedBox(
          height: widget.heightScreen * 0.03,
        ),
        FutureBuilder(
            future: future,
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
               return const Center(child: CircularProgressIndicator());
              }
              return ShowContentTasbeh(widthScreen: widget.widthScreen);
            },
        )
        //ShowContentTasbeh(),
      ],
    );
  }
}
