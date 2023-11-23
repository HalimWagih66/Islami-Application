import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Islami/features/layout_screen/tasbeh_Tap/view/widget/show_content_tasbeh.dart';
import 'package:Islami/features/layout_screen/tasbeh_Tap/view/widget/show_counter_tasbeh.dart';
import 'package:Islami/features/layout_screen/tasbeh_Tap/view/widget/show_image_sabhuh.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../view model/tasbeh_tap_view_model.dart';

class TasbehTapBody extends StatefulWidget {
  const TasbehTapBody({super.key});


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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const ShowImageSabhuh(),
          SizedBox(
            height: 40.h,
          ),
          Text(AppLocalizations.of(context)!.number_of_praises, style: Theme.of(context).textTheme.titleLarge),
          SizedBox(
            height: 26.h,
          ),
          const ShowCounterTasbeh(),
          SizedBox(
            height: 22.h,
          ),
          FutureBuilder(
              future: future,
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting){
                 return const Center(child: CircularProgressIndicator());
                }
                return const ShowContentTasbeh();
              },
          )
          //ShowContentTasbeh(),
        ],
      ),
    );
  }
}
