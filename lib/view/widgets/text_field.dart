import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_baghdad/controller/widgets/space_widget.dart';

class CustomTextField extends StatelessWidget {
  final String placeHolder;
  final TextEditingController textEditingController;
  final String svg_path;
  final String? Function(String? value)? validator;
  const CustomTextField({
    Key? key,
    required this.placeHolder,
    required this.textEditingController,
    required this.svg_path,
    this.validator,
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
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    width: 25,
                    height: 25,
                    child: SvgPicture.asset("Assets/svg/$svg_path")),
                    horizontal_space(10),
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: TextFormField(
                      controller: textEditingController,
                      decoration: InputDecoration(
                        hintText: placeHolder,
                        hintStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(bottom: 4),
                      ),
                      validator: validator,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
