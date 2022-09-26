import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../configurations/front_end.dart';
import '../../elements/app_drawer.dart';
import '../../elements/custom_text.dart';
import '../../routes/route_names.dart';
import 'layout/body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FrontEndConfigs.kScaffoldColor,
      appBar: AppBar(
        title: const CustomText(
            text: 'Profile', fontSize: 14, fontWeight: FontWeight.bold),
        actions: [
          IconButton(
            tooltip: "Log Out",
            splashRadius: 30,
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushNamedAndRemoveUntil(
                  context, RouteNames.loginViewRoute, (route) => false);
            },
            icon: const Icon(
              Icons.logout,
              size: 25,
              color: FrontEndConfigs.kPrimaryColor,
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      drawer: const AppDrawer(),
      body: const ProfileViewBody(),
    );
  }
}
