import 'package:flutter/material.dart';

import 'package:taxi_baghdad/themes/main_colors.dart';

class Button extends StatelessWidget {
  final Color buttonColor;
  final String buttonTitle;
  final Function() toDo;
  const Button({
    Key? key,
    this.buttonColor = MainColors.yellowColor,
    required this.buttonTitle,
    required this.toDo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          shadowColor: Colors.transparent,
          backgroundColor: buttonColor,
        ),
        onPressed: () {},
        child: Text(
          buttonTitle,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
