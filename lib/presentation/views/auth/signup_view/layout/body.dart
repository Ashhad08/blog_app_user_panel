import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../../../backend/models/user.dart';
import '../../../../../backend/services/auth.dart';
import '../../../../../backend/services/system.dart';
import '../../../../../configurations/front_end.dart';
import '../../../../elements/auth_text_field.dart';
import '../../../../elements/custom_button.dart';
import '../../../../elements/custom_text.dart';
import '../../../../routes/route_names.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({Key? key}) : super(key: key);

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final TextEditingController _phoneNumberController = TextEditingController();

  final _key = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AuthServices authServices = AuthServices();
    SystemServices systemServices = SystemServices();
    return LoadingOverlay(
      isLoading: isLoading,
      opacity: 0.2,
      child: Scaffold(
        backgroundColor: FrontEndConfigs.kWhiteColor,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Form(
              key: _key,
              child: Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  const CustomText(
                      text: 'Let’s Get Started!',
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                  const CustomText(
                      text:
                          'Create an account to get all updates the updates on your phone',
                      fontSize: 12,
                      align: TextAlign.center,
                      textColor: FrontEndConfigs.kSubTextColor,
                      fontWeight: FontWeight.w500),
                  const SizedBox(
                    height: 60,
                  ),
                  AuthTextField(
                    hintText: 'Full Name',
                    prefixIcon: Icons.person,
                    textEditingController: _nameController,
                    textInputType: TextInputType.text,
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Enter your full name';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AuthTextField(
                    hintText: 'Email Address',
                    prefixIcon: Icons.email,
                    textEditingController: _emailController,
                    textInputType: TextInputType.emailAddress,
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Enter your email';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AuthTextField(
                    hintText: 'Password',
                    prefixIcon: Icons.lock,
                    textEditingController: _passwordController,
                    textInputType: TextInputType.text,
                    isPasswordField: true,
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Enter Password!';
                      } else if (val.length < 7) {
                        return 'Password must above 6 characters';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AuthTextField(
                    hintText: 'Confirm Password',
                    prefixIcon: Icons.lock,
                    textEditingController: _confirmPasswordController,
                    textInputType: TextInputType.text,
                    isPasswordField: true,
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Confirm your Password!';
                      } else if (_confirmPasswordController.text !=
                          _passwordController.text) {
                        return 'Password dose not match';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AuthTextField(
                    hintText: 'Phone Number',
                    prefixIcon: Icons.call,
                    textEditingController: _phoneNumberController,
                    textInputType: TextInputType.phone,
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Enter Phone Number!';
                      } else if (val.length != 11) {
                        return 'Phone number must be 11 Numbers';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  CustomButton(
                      buttonText: 'Sign up',
                      height: 46,
                      width: 170,
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          makeLoadingTrue();
                          authServices
                              .signUpUser(
                                  email: _emailController.text,
                                  password: _passwordController.text)
                              .then((value) async {
                            await systemServices
                                .createNewUser(
                              UserModel(
                                  uid: FirebaseAuth.instance.currentUser!.uid,
                                  name: _nameController.text,
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                  phoneNumber: _phoneNumberController.text),
                            )
                                .then((value) {
                              makeLoadingFalse();
                              Navigator.pushNamed(
                                  context, RouteNames.bottomBarViewRoute);
                            }).onError((error, stackTrace) {
                              makeLoadingFalse();
                              FrontEndConfigs.showSnackBar(
                                  context: context,
                                  message: 'Something went wrong try again',
                                  color: Colors.red);
                            });
                          }).onError((error, stackTrace) {
                            makeLoadingFalse();
                            if (error
                                .toString()
                                .contains('operation-not-allowed')) {
                              FrontEndConfigs.showSnackBar(
                                  context: context,
                                  message: 'Anonymous accounts are not enabled',
                                  color: Colors.red);
                            } else if (error
                                .toString()
                                .contains('weak-password')) {
                              FrontEndConfigs.showSnackBar(
                                  context: context,
                                  message: 'Your password is too weak',
                                  color: Colors.red);
                            } else if (error
                                    .toString()
                                    .contains('invalid-email') ||
                                error
                                    .toString()
                                    .contains('invalid-credential')) {
                              FrontEndConfigs.showSnackBar(
                                  context: context,
                                  message: 'Your email is invalid',
                                  color: Colors.red);
                            } else if (error
                                .toString()
                                .contains('email-already-in-use')) {
                              FrontEndConfigs.showSnackBar(
                                  context: context,
                                  message:
                                      'Email is already in use on different account',
                                  color: Colors.red);
                            } else if (error
                                .toString()
                                .contains('network-request-failed')) {
                              FrontEndConfigs.showSnackBar(
                                  context: context,
                                  message: 'Check your internet connection',
                                  color: Colors.red);
                            } else {
                              debugPrint(error.toString());
                            }
                          });
                        }
                      }),
                  const SizedBox(
                    height: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomText(
                        text: "Already have an account? ",
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        textColor: Color(0xff6E6E6E),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, RouteNames.loginViewRoute);
                        },
                        child: const CustomText(
                          text: "Sign in",
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
        ),
      ),
    );
  }

  makeLoadingTrue() {
    isLoading = true;
    setState(() {});
  }

  makeLoadingFalse() {
    isLoading = false;
    setState(() {});
  }
}
