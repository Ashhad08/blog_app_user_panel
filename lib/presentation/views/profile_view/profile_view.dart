import 'package:flutter/material.dart';

import '../../elements/app_drawer.dart';
import '../../elements/custom_text.dart';
import 'layout/body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
            text: 'Profile', fontSize: 14, fontWeight: FontWeight.bold),
      ),
      drawer: const AppDrawer(),
      body: const ProfileViewBody(),
    );
  }
}
