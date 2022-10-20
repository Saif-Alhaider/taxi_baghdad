import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:taxi_baghdad/themes/main_colors.dart';

class Button extends StatefulWidget {
  final Color buttonColor;
  final String buttonTitle;
  final Future<Null> Function() toDo;
  const Button({
    Key? key,
    this.buttonColor = MainColors.yellowColor,
    required this.buttonTitle,
    required this.toDo,
  }) : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool active = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
          horizontal: active ? MediaQuery.of(context).size.width * 0.35 : 0),
      height: 54,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            shadowColor: Colors.transparent,
            backgroundColor: widget.buttonColor,
            padding: EdgeInsets.zero),
        onPressed: () async {
          setState(() {});
          active = true;
          await Future.delayed(Duration(milliseconds:1500 ));
          await widget.toDo();
          setState(() {});
          active = false;
        },
        child: active
            ? Transform.scale(
                scale: 1.8,
                child: LottieBuilder.asset(
                  "Assets/lottie/loading_progress.json",
                  fit: BoxFit.cover,
                ),
              )
            : Text(
                widget.buttonTitle,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w200,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
      ),
    );
  }
}
