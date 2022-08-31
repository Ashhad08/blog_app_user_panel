import 'package:flutter/material.dart';

import '../../elements/app_drawer.dart';
import '../../elements/custom_text.dart';
import '../../routes/route_names.dart';
import 'layout/body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
            text: 'Feeds', fontSize: 14, fontWeight: FontWeight.bold),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, RouteNames.conversationsViewRoute);
            },
            child: Image.asset(
              "assets/icons/chat.png",
              height: 30,
              width: 30,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: const HomeViewBody(),
    );
  }
}
