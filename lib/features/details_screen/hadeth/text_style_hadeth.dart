import 'package:flutter/material.dart';

class TextStyleHadeth extends StatelessWidget {
  final String content;
  const TextStyleHadeth({super.key, required this.content});
  @override
  Widget build(BuildContext context) {
    return Text(
        content,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
