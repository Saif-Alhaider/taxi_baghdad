import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:taxi_baghdad/view/widgets/buttons/button.dart';
import 'package:taxi_baghdad/view/widgets/space_widget.dart';
import 'package:taxi_baghdad/themes/main_colors.dart';

import '../../../controller/Authentication/login.dart';
import '../../../controller/check_connectivity/check_connectivity.dart';
import '../../widgets/text_field.dart';
import '../signup/create_account_text.dart';

class Signin extends StatelessWidget {
  const Signin({super.key});
  static final TextEditingController _emailController = TextEditingController();
  static final TextEditingController _passwordController =
      TextEditingController();
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static final FirebaseAuth _auth = FirebaseAuth.instance;
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
              const CreateAccountViaSites(
                firstTitle: "تسجيل الدخول",
                secondTitle: "تسجيل الدخول بواسطة",
                thirdTitle: "او تسجيل الدخول عن طريق الايميل",
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      placeHolder: "الحساب الالكتروني",
                      textEditingController: _emailController,
                      svg_path: 'email.svg',
                      validator: (value) {
                        bool emailCheck = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value!);
                        if (!emailCheck) {
                          return "الرجاء كتابة الحساب بطريقة صحيحة";
                        }
                      },
                    ),
                    vertical_space(10.0),
                    CustomTextField(
                      placeHolder: "كلمة السر",
                      textEditingController: _passwordController,
                      svg_path: 'lock.svg',
                    ),
                  ],
                ),
              ),
              vertical_space(20.0),
              SizedBox(
                width: double.maxFinite,
                height: 55,
                child: Button(
                  buttonTitle: "تسجيل الدخول",
                  toDo: () async {
                    final FormState? form = _formKey.currentState;
                    if (form!.validate()) {
                      // connectivity
                      if (await check_connectivity(context)) return;
                      // login
                      loginUser(
                          auth: _auth,
                          context: context,
                          email: _emailController.text,
                          password: _passwordController.text);
                    }
                  },
                  buttonColor: Color.fromARGB(200, 0, 0, 0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
