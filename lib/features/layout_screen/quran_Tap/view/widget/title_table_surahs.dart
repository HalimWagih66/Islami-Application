import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleTableSurahs extends StatelessWidget {
  const TitleTableSurahs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: Theme.of(context).hintColor,
          thickness: 3.h,
        ),
        Table(
          textBaseline:TextBaseline.alphabetic ,
          children: [
            TableRow(
                children: [
                  Text(AppLocalizations.of(context)!.number_of_verses,style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 25.sp),textAlign: TextAlign.center,),
                  Text(AppLocalizations.of(context)!.surah_name,style: Theme.of(context).textTheme.titleLarge,textAlign: TextAlign.center,),
                ]
            )
          ],
        ),
        Divider(
          color: Theme.of(context).hintColor,
          thickness: 3.h,
        ),
      ],
    );
  }
}
