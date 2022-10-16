import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String placeHolder;
  final TextEditingController textEditingController;
  const CustomTextField({
    Key? key,
    required this.placeHolder,
    required this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Color(0xffF5F7F9),
        borderRadius: BorderRadius.circular(12),
        // border: Border.all(color: Colors.grey)
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Center(
          child: TextFormField(
            controller: textEditingController,
            decoration: InputDecoration(
                hintText: placeHolder,
                hintStyle: TextStyle(color: Colors.black),
                border: InputBorder.none),
          ),
        ),
      ),
    );
  }
}
