import 'package:flutter/material.dart';
import 'package:taxi_baghdad/controller/widgets/space_widget.dart';
import 'package:taxi_baghdad/themes/main_colors.dart';

import '../../widgets/text_field.dart';

class Signin extends StatelessWidget {
  const Signin({super.key});
  static final TextEditingController _emailController = TextEditingController();
  static final TextEditingController _passwordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("signin")),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    CustomTextField(
                      placeHolder: "الحساب الالكتروني",
                      textEditingController: _emailController,
                      svg_path: 'email.svg',
                    ),
                    vertical_space(10.0),
                    CustomTextField(
                      placeHolder: "كلمة السر",
                      textEditingController: _passwordController,
                      svg_path: 'lock.svg',
                    ),
                  ],
                ),
                vertical_space(20.0),
                SizedBox(
                  width: double.maxFinite,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      shadowColor: Colors.transparent,
                      backgroundColor: MainColors.yellowColor,
                    ),
                    onPressed: () {},
                    child: const Text(
                      "تسجيل الدخول",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
