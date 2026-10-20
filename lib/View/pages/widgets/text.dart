import 'package:flutter/material.dart';
import 'package:shefaa/controller/data/variable.dart';

class thetext extends StatelessWidget {
  thetext({
    super.key,
    required this.text,
    required this.sizetext,
  });
  final text;
  final double sizetext;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: coltext,
        fontSize: sizetext,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
