import 'package:flutter/material.dart';
class ShowBottomSheetTasbeh extends StatelessWidget {
  final List<String>contentTasbeh;
  final List<String>rewardTasbeh;
  final Function callBack;
  const ShowBottomSheetTasbeh({super.key, required this.contentTasbeh,required this.rewardTasbeh,required this.callBack});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return TextButton(
          onPressed: () {
            callBack(index);
          },
          child: Container(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              textDirection: TextDirection.rtl,
              children: [
                Text(contentTasbeh[index],style: Theme.of(context).textTheme.bodyMedium,textAlign: TextAlign.center),
                const SizedBox(height: 5),
                Text(rewardTasbeh[index],style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey),textAlign: TextAlign.center),
                const SizedBox(height: 7),
              ],
            ),
          ),
        );
      },
      itemCount: contentTasbeh.length,
    );
  }
}
