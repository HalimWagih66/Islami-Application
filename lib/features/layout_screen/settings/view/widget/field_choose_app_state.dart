import 'package:flutter/material.dart';

class FieldChooseAppState  extends StatelessWidget {
  const FieldChooseAppState ({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 13),
      decoration: BoxDecoration(
          border: Border.all(
              width: 2,
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
                ?.copyWith(fontWeight: FontWeight.w100, fontSize: 23),
          ),
          Icon(Icons.arrow_drop_down_outlined,color: Theme.of(context).hintColor),
        ],
      ),
    );
  }
}
