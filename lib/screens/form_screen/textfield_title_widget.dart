import 'package:flutter/material.dart';

class TextFieldTitleWidget extends StatelessWidget {
  final String title;

  const TextFieldTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.start,

      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, height: 3),
    );
  }
}
