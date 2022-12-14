import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:taxi_baghdad/controller/Authentication/register.dart';
import 'package:taxi_baghdad/view/Authentication/signup/create_account_text.dart';

import '../../../controller/check_connectivity/check_connectivity.dart';
import '../../widgets/buttons/button.dart';
import '../../widgets/space_widget.dart';
import '../../widgets/text_field.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});
  static final TextEditingController _userNameController =
      TextEditingController();
  static final TextEditingController _emailController = TextEditingController();
  static final TextEditingController _passwordController =
      TextEditingController();
  static final TextEditingController _confirmPasswordController =
      TextEditingController();
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CreateAccountViaSites(firstTitle: "انشاء حساب",secondTitle: "انشاء حساب بواسطة",thirdTitle: "او انشئ حساب عن طريق الايميل"),
                Column(
                  children: [
                    Column(
                  children: [
                    CustomTextField(
                      placeHolder: "اسم المستخدم",
                      textEditingController: _userNameController,
                      svg_path: 'user.svg',
                      validator: (value) {
                        if (value!.length <= 4) {
                          return "الاسم قصير";
                        }
                      },
                    ),
                    vertical_space(10.0),
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
                      validator: (value) {
                        if (value!.length < 5) {
                          return "كلمة السر قصيرة";
                        }
                      },
                    ),
                    vertical_space(10.0),
                    CustomTextField(
                      placeHolder: "تأكيد كلمة السر",
                      textEditingController: _confirmPasswordController,
                      svg_path: 'lock.svg',
                      validator: (value) {
                        if (_passwordController.text != value) {
                          return "كلمة السر يجب ان تكون مطابقة";
                        } else if (value!.length < 5) {
                          return "كلمة السر قصيرة";
                        }
                      },
                    ),
                  ],
                ),
                vertical_space(20),
                Button(
                  buttonTitle: "انشاء حساب",
                  toDo: () async {
                    final FormState? form = _formKey.currentState;

                    if (form!.validate()) {
                      // connectivity
                      if (await check_connectivity(context)) return;
                      // registering new user
                      registerUser(
                        auth: _auth,
                        email: _emailController.text,
                        password: _passwordController.text,
                        username: _userNameController.text,
                        context: context,
                      );
                    }
                  },
                  buttonColor: const Color.fromARGB(200, 0, 0, 0),
                )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
