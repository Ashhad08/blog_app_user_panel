import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'layout/body.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: const Scaffold(
        body: LoginViewBody(),
      ),
    );
  }
}
