import 'package:flutter/material.dart';

import '../../../../configurations/front_end.dart';
import '../../../elements/custom_text.dart';
import 'widgets/profile_view_text_field.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FrontEndConfigs.kScaffoldColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                  BoxShadow(
                      color: FrontEndConfigs.kBlackColor.withOpacity(0.1),
                      offset: const Offset(0, 3),
                      spreadRadius: -5,
                      blurRadius: 10)
                ]),
                child: Image.asset(
                  'assets/images/profile.png',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    CustomText(
                        text: 'Edit profile ',
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                    SizedBox(
                      height: 20,
                    ),
                    ProfileViewTextField(
                      hintText: 'username',
                      prefixIcon: Icons.person_outline,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ProfileViewTextField(
                      hintText: 'Email',
                      prefixIcon: Icons.email_outlined,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ProfileViewTextField(
                      hintText: 'Phone Number',
                      prefixIcon: Icons.local_phone_outlined,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
