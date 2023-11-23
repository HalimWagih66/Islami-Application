import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../../models/model.radio/radio.dart';
import '../../view model/radio_tap_view_model.dart';

class RadioItem extends StatelessWidget {
   const RadioItem({super.key, required this.radioModel});
  final List<RadioModel> radioModel;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<RadioTapViewModel>(context);
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        children: [
          Text(radioModel[provider.selectedRadioStation].name??"",style: Theme.of(context).textTheme.titleLarge,),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(onPressed: ()async{
                if(provider.selectedRadioStation == radioModel.length)return;
                await provider.onPressedNextRadioStation(radioModel[provider.selectedRadioStation].radioUrl??"");

              }, icon: Icon(Icons.skip_previous,color: Theme.of(context).hintColor),iconSize: 39),
              IconButton(onPressed: ()async{

                  await provider.onPressedPlayAndPauseRadioStation(radioModel[provider.selectedRadioStation].radioUrl??"");

              }, icon: Icon(provider.isPlay? Icons.pause:Icons.play_arrow,color: Theme.of(context).hintColor),iconSize: 58),
              IconButton(onPressed: ()async{

                await provider.onPressedFormerRadioStation(radioModel[provider.selectedRadioStation].radioUrl??"");

              }, icon: Icon(Icons.skip_next,color: Theme.of(context).hintColor),iconSize: 39)
            ],
          )
        ],
      ),
    );
  }
}
