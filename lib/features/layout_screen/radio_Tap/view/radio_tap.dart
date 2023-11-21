import 'package:flutter/material.dart';
import 'package:islami_app/api%20manager/api_manager.dart';
import 'package:islami_app/features/layout_screen/radio_Tap/view/widget/radio_item.dart';
import 'package:provider/provider.dart';

import '../../provider/settings_provider.dart';
import '../view model/radio_tap_view_model.dart';


class RadioTap extends StatelessWidget {
  const RadioTap({super.key});
  @override
  Widget build(BuildContext context) {
    var settingProvider = Provider.of<SettingsProvider>(context);
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset("assets/images/layout screen/radio_tap/radio.png"),
        SizedBox(height: MediaQuery.of(context).size.height * .1),
        FutureBuilder(
            future: ApiManager.getRadio(settingProvider.languageCode == "en"?"eng":"ar"),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return const Center(child: CircularProgressIndicator());
              }
              else if(snapshot.hasError || snapshot.data?.isEmpty == true){
                return const Center(child: Text("something went wrong please try later"));
              }
              return RadioItem(radioModel: snapshot.data!);
            },
        ),
      ],
    );
  }
}
