import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../configurations/front_end.dart';
import '../../../routes/route_names.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteNames.loginViewRoute,
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FrontEndConfigs.kWhiteColor,
      body: Center(
        child: Image.asset('assets/images/logo.png'),
      ),
    );
  }
}
