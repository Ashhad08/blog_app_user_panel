import 'package:flutter/material.dart';

import '../../../../../configurations/front_end.dart';
import '../../../../elements/auth_text_field.dart';
import '../../../../elements/custom_button.dart';
import '../../../../elements/custom_text.dart';
import '../../../../routes/route_names.dart';
import 'widgets/google_button.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFCFCFC),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(
                height: 63,
              ),
              Image.asset(
                "assets/images/login.png",
                height: 185,
                width: 237,
              ),
              const CustomText(
                text: "Welcome Back!",
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
              const CustomText(
                text: "Login into your existing account",
                fontSize: 12,
                textColor: FrontEndConfigs.kSubTextColor,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(
                height: 40,
              ),
              const AuthTextField(
                hintText: 'Email Address',
                prefixIcon: Icons.email,
                isPasswordField: false,
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 10,
              ),
              const AuthTextField(
                hintText: 'Password',
                prefixIcon: Icons.lock,
                isPasswordField: true,
              ),
              const SizedBox(
                height: 10,
              ),
              const Align(
                alignment: Alignment.centerRight,
                child: CustomText(
                  text: "Forgot Password?",
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              CustomButton(
                buttonText: 'Login',
                height: 46,
                width: 170,
                onPressed: () {},
              ),
              const SizedBox(
                height: 25,
              ),
              const CustomText(
                text: 'Or Continue Using',
                fontSize: 12,
                fontWeight: FontWeight.w300,
                textColor: Color(0xff6E6E6E),
              ),
              const SizedBox(
                height: 25,
              ),
              const GoogleButton(),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomText(
                    text: "Don’t have an account? ",
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    textColor: Color(0xff6E6E6E),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RouteNames.signUpViewRoute);
                    },
                    child: const CustomText(
                      text: "Sign up",
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      textColor: FrontEndConfigs.kPrimaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
