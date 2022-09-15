import 'package:flutter/material.dart';

import '../../../../configurations/front_end.dart';
import 'layout/body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: FrontEndConfigs.kWhiteColor,
      body: SignUpViewBody(),
    );
  }
}
