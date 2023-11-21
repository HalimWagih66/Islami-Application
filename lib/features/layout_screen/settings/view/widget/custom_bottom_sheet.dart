import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/settings_provider.dart';
import 'button_style_bottom_sheet.dart';
class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key, required this.textButtonTheFirst, required this.textButtonTheSecond, required this.executeMethodButtonTheFirst, required this.background, required this.executeMethodButtonTheSecond, required this.typeBottomSheet});
  final String textButtonTheFirst;
  final String textButtonTheSecond;
  final Function executeMethodButtonTheFirst;
  final Function executeMethodButtonTheSecond;
  final String typeBottomSheet;
  final Color background;
  @override
  Widget build(BuildContext context) {
    var settingsProvider =  Provider.of<SettingsProvider>(context);
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            style: buttonStyleBottomSheet(alignmentGeometry: settingsProvider.isLanguageEnglish()?Alignment.centerLeft:Alignment.centerRight,context:context,backgroundColor: settingsProvider.isDarkEnabled() ? const Color(0xff414d7c) : const Color(0x51eacc92)),
              onPressed: () {
                executeMethodButtonTheFirst();
              },
              child: firstChild(context),
          ),
           SizedBox(
            height: MediaQuery.of(context).size.height * .04,
          ),
          ElevatedButton(
            style: buttonStyleBottomSheet(alignmentGeometry: settingsProvider.isLanguageEnglish()?Alignment.centerLeft:Alignment.centerRight,context:context,backgroundColor: settingsProvider.isDarkEnabled() ? const Color(0xff414d7c) : const Color(0x51eacc92)),
              onPressed: () {
                executeMethodButtonTheSecond();
              },
              child: secondChild(context),
          )
        ],
      ),
    );
  }

  Widget getSelectedWidget(String title, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: Theme.of(context).textTheme.bodyLarge
                ?.copyWith(color: Theme.of(context).hintColor)),
        Icon(Icons.check, color: Theme.of(context).hintColor),
      ],
    );
  }

  Widget getUnSelectedWidget(String title, BuildContext context) {
    return Text(title, style: Theme.of(context).textTheme.bodyLarge);
  }
  Widget firstChild(BuildContext context){
    var provider = Provider.of<SettingsProvider>(context,listen: false);
    if(typeBottomSheet == "language"){
      return provider.isLanguageEnglish() ? getSelectedWidget(textButtonTheFirst, context) : getUnSelectedWidget(textButtonTheFirst, context);
    }else{
      return provider.isDarkEnabled() ? getUnSelectedWidget(textButtonTheFirst, context) : getSelectedWidget(textButtonTheFirst, context);
    }
  }
  Widget secondChild(BuildContext context){
    var provider = Provider.of<SettingsProvider>(context,listen: false);
    if(typeBottomSheet == "language"){
      return provider.isLanguageEnglish() ? getUnSelectedWidget(textButtonTheSecond, context) : getSelectedWidget(textButtonTheSecond, context);
    }else{
      return provider.isDarkEnabled() ? getSelectedWidget(textButtonTheSecond, context) : getUnSelectedWidget(textButtonTheSecond, context);
    }
  }

}
