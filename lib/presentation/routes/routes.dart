import 'package:flutter/material.dart';

import '../elements/custom_text.dart';
import '../views/auth/login_view/login_view.dart';
import '../views/auth/signup_view/signup_view.dart';
import '../views/auth/splash_view/splash_view.dart';
import '../views/bottom_bar_view/bottom_bar_view.dart';
import '../views/chat_view/chat_view.dart';
import '../views/conversations_view/conversations_view.dart';
import '../views/event_details_view/event_details_view.dart';
import '../views/program_details_view/program_details_view.dart';
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
      case RouteNames.bottomBarViewRoute:
        return MaterialPageRoute(builder: (context) => BottomBarView());
      case RouteNames.programDetailsViewRoute:
        return MaterialPageRoute(builder: (context) => ProgramDetailsView());
      case RouteNames.eventDetailsViewRoute:
        return MaterialPageRoute(builder: (context) => EventDetailsView());
      case RouteNames.conversationsViewRoute:
        return MaterialPageRoute(builder: (context) => ConversationsView());
      case RouteNames.chatViewRoute:
        return MaterialPageRoute(builder: (context) => ChatView());
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
