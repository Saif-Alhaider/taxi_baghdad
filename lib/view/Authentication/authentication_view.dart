import 'package:flutter/material.dart';
import 'package:taxi_baghdad/view/Authentication/signin/signin_screen.dart';
import 'package:taxi_baghdad/view/Authentication/signup/signup_screen.dart';
import 'package:taxi_baghdad/view/widgets/buttons/double_button.dart';
import 'package:taxi_baghdad/view/widgets/space_widget.dart';

class AuthenticationView extends StatelessWidget {
  AuthenticationView({super.key});
  PageController _pageViewController = PageController();
  static final List<Widget> pages = [
    Signin(),
    SignUp(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          // controller: controller,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: PageView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _pageViewController,
                    children: pages),
              ),
              DoubleButton(
                firstButton: (() {
                  _pageViewController.previousPage(
                      duration: Duration(milliseconds: 250),
                      curve: Curves.easeIn);
                }),
                secondButton: () {
                  _pageViewController.nextPage(
                      duration: Duration(milliseconds: 250),
                      curve: Curves.easeIn);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
