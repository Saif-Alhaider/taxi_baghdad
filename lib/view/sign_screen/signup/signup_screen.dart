import 'package:flutter/material.dart';

import '../../../controller/widgets/space_widget.dart';
import '../../widgets/button.dart';
import '../../widgets/text_field.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});
  static TextEditingController _userNameController = TextEditingController();
  static TextEditingController _emailController = TextEditingController();
  static TextEditingController _passwordController = TextEditingController();
  static TextEditingController _confirmPasswordController = TextEditingController();
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                        children: [
                          CustomTextField(
                            placeHolder: "اسم المستخدم",
                            textEditingController: _userNameController,
                            svg_path: 'user.svg',
                            validator: (value) {
                              if (value!.length <2) {
                                return "name is too short";
                              }
                            },
                          ),
                          vertical_space(10.0),
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
                          vertical_space(10.0),
                          CustomTextField(
                            placeHolder: "تأكيد كلمة السر",
                            textEditingController: _confirmPasswordController,
                            svg_path: 'lock.svg',
                          ),
                          
                        ],
                      ),
                      vertical_space(10),
                      Button(buttonTitle: "تسجيل حساب",toDo: (){
                        final FormState? form = _formKey.currentState;
                        if (form!.validate()) {
                          
                        }
                      },buttonColor: Color.fromARGB(200, 0, 0, 0),)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
