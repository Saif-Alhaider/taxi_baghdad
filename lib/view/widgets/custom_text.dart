import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final FontWeight fontWeight;
  final TextOverflow? overflow;
  const CustomText({
    Key? key,
    required this.text,
    this.color = Colors.black,
    this.size = 18,
    this.fontWeight = FontWeight.normal,
    this.overflow,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(color: color,fontSize:size,fontWeight: fontWeight ,overflow: overflow),);
  }
}
