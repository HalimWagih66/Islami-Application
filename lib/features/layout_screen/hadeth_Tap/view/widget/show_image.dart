import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowImage extends StatelessWidget {
  const ShowImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 219.h,
      width: 312.w,
      child: const Image(
        image: AssetImage("assets/images/layout screen/hadeth_tap/logo_header_hadeth_tap.png"),
      ),
    );
  }
}
