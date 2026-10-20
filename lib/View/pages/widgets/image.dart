import 'package:flutter/material.dart';

class image extends StatelessWidget {
  const image({super.key,required this.theimage});
final  theimage;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      theimage,
      fit: BoxFit.fill,
      
    );
  }
}
