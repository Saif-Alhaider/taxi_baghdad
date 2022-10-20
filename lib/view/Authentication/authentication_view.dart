import 'package:flutter/material.dart';
import 'package:taxi_baghdad/view/Authentication/signin/signin_screen.dart';
import 'package:taxi_baghdad/view/Authentication/signup/signup_screen.dart';
import 'package:taxi_baghdad/view/widgets/buttons/double_button.dart';

class AuthenticationView extends StatelessWidget {
  AuthenticationView({super.key});
  PageController _pageViewController = PageController();
  static final List<Widget> pages = [SignUp(), Signin()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: PageView(controller: _pageViewController,children: pages),
          ),
          DoubleButton(
            firstButton: (() {
              _pageViewController.previousPage(duration: Duration(milliseconds: 250), curve: Curves.easeIn);
            }),
            secondButton: () {
              _pageViewController.nextPage(duration: Duration(milliseconds: 250), curve: Curves.easeIn);
            },
          )
        ],
      ),
    );
  }
}
