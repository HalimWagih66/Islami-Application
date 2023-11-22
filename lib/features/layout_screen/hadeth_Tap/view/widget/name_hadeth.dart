import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Islami/models/models.hadeth/hadeth.dart';

import '../../../../details_screen/hadeth/details_hadeth.dart';


class HadethName extends StatelessWidget {
  final Hadith hadeth;

  const HadethName({super.key, required this.hadeth});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: InkWell(
        onTap: (){
          Navigator.pushNamed(context,
              DetailsHadeth.routeName,
            arguments: hadeth
          );
        },
        child: Text(
          hadeth.title,
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
