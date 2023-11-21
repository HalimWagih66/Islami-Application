import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../shared/network/local/shared_preferences/tasbeh_data.dart';
import '../../view model/tasbeh_tap_view_model.dart';

class ShowCounterTasbeh extends StatelessWidget {
  const ShowCounterTasbeh({super.key});
  @override
  Widget build(BuildContext context) {
    var tasbehProvider = Provider.of<TasbehTapViewModel>(context);
    tasbehProvider.getNumberTasbeh();
    return GestureDetector(
      onLongPress: () async {
        tasbehProvider.onLongPressCounterTasbeh();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Theme.of(context).primaryColor.withOpacity(0.5),
        ),
        padding: const EdgeInsets.all(20),
        child: Text(
            "${tasbehProvider.counterNumberTasbeh}",
            style: Theme.of(context).textTheme.bodyLarge),
      ),
    );
  }
}
