// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ResultDisplay extends StatelessWidget {
  String defaultDisplay;
  ResultDisplay({Key? key, required this.defaultDisplay}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      width: double.infinity,
      height: 150,
      color: Colors.black54,
      child: Text(
        defaultDisplay,
        style: const TextStyle(fontSize: 100, color: Colors.white),
      ),
    );
  }
}
