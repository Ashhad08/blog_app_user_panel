import 'package:flutter/material.dart';

import '../../backend/models/event_model.dart';
import '../../backend/models/program_model.dart';
import '../elements/custom_text.dart';
import '../views/auth/login_view/login_view.dart';
import '../views/auth/signup_view/signup_view.dart';
import '../views/auth/splash_view/splash_view.dart';
import '../views/bottom_bar_view/bottom_bar_view.dart';
import '../views/chat_view/chat_view.dart';
import '../views/conversations_view/conversations_view.dart';
import '../views/create_new_chat/create_new_chat.dart';
import '../views/event_details_view/event_details_view.dart';
import '../views/program_details_view/program_details_view.dart';
import 'route_names.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashViewRoute:
        return MaterialPageRoute(builder: (context) => const SplashView());
      case RouteNames.loginViewRoute:
        return MaterialPageRoute(builder: (context) => const LoginView());
      case RouteNames.signUpViewRoute:
        return MaterialPageRoute(builder: (context) => const SignUpView());
      case RouteNames.bottomBarViewRoute:
        return MaterialPageRoute(builder: (context) => const BottomBarView());
      case RouteNames.programDetailsViewRoute:
        return MaterialPageRoute(
            builder: (context) => ProgramDetailsView(
                  settings.arguments as ProgramModel,
                ));
      case RouteNames.eventDetailsViewRoute:
        return MaterialPageRoute(
            builder: (context) =>
                EventDetailsView(settings.arguments as EventModel));
      case RouteNames.conversationsViewRoute:
        return MaterialPageRoute(
            builder: (context) => const ConversationsView());
      case RouteNames.chatViewRoute:
        return MaterialPageRoute(
            builder: (context) => ChatView(settings.arguments as Map));
      case RouteNames.createNewChatViewRoute:
        return MaterialPageRoute(
            builder: (context) => const CreateNewChatView());
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
