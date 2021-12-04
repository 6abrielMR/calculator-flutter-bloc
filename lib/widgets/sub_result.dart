import 'package:flutter/material.dart';

class SubResult extends StatelessWidget {
  final String text;
  final double? height;

  const SubResult({Key? key, required this.text, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height ?? 40,
      alignment: Alignment.centerRight,
      child: Text(text, style: const TextStyle(fontSize: 30)),
    );
  }
}
