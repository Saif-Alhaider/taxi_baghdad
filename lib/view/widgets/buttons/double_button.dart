import 'package:flutter/material.dart';

import 'package:taxi_baghdad/view/widgets/space_widget.dart';

class DoubleButton extends StatefulWidget {
  const DoubleButton({
    Key? key,
    required this.firstButton,
    required this.secondButton,
  }) : super(key: key);
  final Function() firstButton;
  final Function() secondButton;

  @override
  State<DoubleButton> createState() => _DoubleButtonState();
}

class _DoubleButtonState extends State<DoubleButton> {
  static bool active_button = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 220,
      child: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeIn,
            height: 100,
            width: 220 / 2,
            margin: EdgeInsets.only(
              left: !active_button ? 220 / 2 : 0,
            ),
            decoration: BoxDecoration(
              borderRadius: active_button
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12))
                  : const BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12)),
              color: const Color(0xffF8F8FA),
            ),
          ),
          Row(
            children: [
              // signup button
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    active_button = true;
                    widget.firstButton();
                    setState(() {});
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(12)),
                      color: Colors.transparent,
                    ),
                    height: double.maxFinite,
                    child: const Center(
                        child: Text(
                      textAlign: TextAlign.center,
                      "?????????? ????????",
                      style: TextStyle(fontSize: 25),
                    )),
                  ),
                ),
              ),
              // signin button
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    active_button = false;
                    widget.secondButton();
                    setState(() {});
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(12),
                          bottomRight: Radius.circular(12)),
                      color: Colors.transparent,
                    ),
                    height: double.maxFinite,
                    child: const Center(
                        child: Text(
                      textAlign: TextAlign.center,
                      "?????????? ????????????",
                      style: TextStyle(fontSize: 25),
                    )),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}


// Color(0x8EE6E0F8)
// Color(0xffE6E0F8)