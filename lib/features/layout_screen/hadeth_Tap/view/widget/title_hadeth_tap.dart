import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleHadithTap extends StatelessWidget {
  const TitleHadithTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: Theme.of(context).hintColor,
          thickness: 2.h,
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10.0.h),
          child: Text(AppLocalizations.of(context)!.alahadyth,style: Theme.of(context).textTheme.titleLarge),
        ),
        Divider(
          color: Theme.of(context).hintColor,
          thickness: 2.h,
        ),
      ],
    );
  }
}
