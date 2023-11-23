import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FieldChooseAppState  extends StatelessWidget {
  const FieldChooseAppState ({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 13.w),
      decoration: BoxDecoration(
          border: Border.all(
              width: 2.w,
              style: BorderStyle.solid,
              color: Theme.of(context).hintColor),
          borderRadius: BorderRadius.circular(9),
          color: Theme.of(context).cardColor),
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.w400, fontSize: 30.sp),
          ),
          Icon(Icons.arrow_drop_down_outlined,color: Theme.of(context).hintColor),
        ],
      ),
    );
  }
}
