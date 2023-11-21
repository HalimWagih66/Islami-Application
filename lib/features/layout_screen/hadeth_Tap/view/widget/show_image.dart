import 'package:flutter/material.dart';

class ShowImage extends StatelessWidget {
  const ShowImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage("assets/images/layout screen/hadeth_tap/logo_header_hadeth_tap.png"),
    );
  }
}
