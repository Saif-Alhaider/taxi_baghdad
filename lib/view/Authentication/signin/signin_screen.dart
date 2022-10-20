import 'package:flutter/material.dart';
import 'package:taxi_baghdad/view/widgets/buttons/button.dart';
import 'package:taxi_baghdad/view/widgets/space_widget.dart';
import 'package:taxi_baghdad/themes/main_colors.dart';

import '../../widgets/text_field.dart';
import '../signup/create_account_text.dart';

class Signin extends StatelessWidget {
  const Signin({super.key});
  static final TextEditingController _emailController = TextEditingController();
  static final TextEditingController _passwordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CreateAccountViaSites(
                  firstTitle: "تسجيل الدخول",
                  secondTitle: "تسجيل الدخول بواسطة",
                  thirdTitle: "او تسجيل الدخول عن طريق الايميل",
                ),
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
                  child: Button(buttonTitle: "تسجيل الدخول", toDo: (){},buttonColor: Color.fromARGB(200, 0, 0, 0),),
                )
              ],
            ),
          ),
        ),
      );
  }
}
