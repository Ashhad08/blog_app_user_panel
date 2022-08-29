import 'package:flutter/material.dart';

import '../elements/custom_text.dart';
import '../views/auth/login_view/login_view.dart';
import '../views/auth/signup_view/signup_view.dart';
import '../views/auth/splash_view/splash_view.dart';
import 'route_names.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashViewRoute:
        return MaterialPageRoute(builder: (context) => SplashView());
      case RouteNames.loginViewRoute:
        return MaterialPageRoute(builder: (context) => LoginView());
      case RouteNames.signUpViewRoute:
        return MaterialPageRoute(builder: (context) => SignUpView());
      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                  body: Center(
                    child: CustomText(
                        text: "NO ROUTES DEFINED",
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ));
    }
  }
}
