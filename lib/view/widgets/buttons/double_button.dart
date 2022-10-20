import 'package:flutter/material.dart';
import 'package:taxi_baghdad/view/widgets/space_widget.dart';

class DoubleButton extends StatefulWidget {
  const DoubleButton({super.key});

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
            duration: const Duration(milliseconds: 150),
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
              color: const Color.fromARGB(255, 230, 224, 248),
            ),
          ),
          Row(
            children: [
              // signup button
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    active_button = true;
                    setState(() {});
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(12)),
                      color: Color(0x8EE6E0F8),
                    ),
                    height: double.maxFinite,
                    child: const Center(
                        child: Text(
                      textAlign: TextAlign.center,
                      "انشاء حساب",
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
                    setState(() {});
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(12),
                          bottomRight: Radius.circular(12)),
                      color: Color(0x8EE6E0F8),
                    ),
                    height: double.maxFinite,
                    child: const Center(
                        child: Text(
                      textAlign: TextAlign.center,
                      "تسجيل الدخول",
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