import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TitleHadithTap extends StatelessWidget {
  const TitleHadithTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: Theme.of(context).hintColor,
          thickness: 2,
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(AppLocalizations.of(context)!.alahadyth,style: Theme.of(context).textTheme.titleLarge),
        ),
        Divider(
          color: Theme.of(context).hintColor,
          thickness: 2,
        ),
      ],
    );
  }
}
