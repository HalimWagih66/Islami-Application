import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../view model/hadeth_tap_view_model.dart';
import 'name_hadeth.dart';

class ShowNamesHadiths extends StatelessWidget {
  const ShowNamesHadiths({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HadethTapViewModel>(context);
    return FutureBuilder(
      future: provider.reaFile(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return SliverList.separated(
            itemBuilder:  (context, index) => HadethName(hadeth: snapshot.data![index]),
            separatorBuilder:  (context, index) => Divider(
                thickness: 2.h,
                endIndent: 15.w,
                indent: 15.w,
                color: Theme.of(context).hintColor,
                height: 1.h,
              ),
          itemCount: snapshot.data?.length ?? 0,
        );
      },
    );
  }
}
