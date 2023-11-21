import 'package:flutter/material.dart';

ButtonStyle buttonStyleBottomSheet({required BuildContext context, required Color backgroundColor,required AlignmentGeometry alignmentGeometry}) {
  return ElevatedButton.styleFrom(
    alignment: alignmentGeometry,
    backgroundColor: backgroundColor,
    elevation: 0,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)
      ,),
    ),
    padding:  const EdgeInsets.all(20),
  );
}