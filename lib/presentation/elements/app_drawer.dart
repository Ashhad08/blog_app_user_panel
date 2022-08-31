import 'package:flutter/material.dart';

import '../../configurations/front_end.dart';
import 'custom_text.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: FrontEndConfigs.kWhiteColor,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: DrawerHeader(
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 160,
                  width: 160,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 34, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDrawerOptionsText('DONATE TODAY'),
                  const SizedBox(
                    height: 15,
                  ),
                  _buildDrawerOptionsText('SUPPORT US'),
                  const SizedBox(
                    height: 15,
                  ),
                  _buildDrawerOptionsText('NOTIFICATIONS '),
                  const SizedBox(
                    height: 15,
                  ),
                  _buildDrawerOptionsText('SETTING'),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 0.2,
              height: 0,
              color: Color(0xff707070),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 34, top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDrawerOptionsText('A b o u t   u s '.toUpperCase()),
                  const SizedBox(
                    height: 15,
                  ),
                  _buildDrawerOptionsText('C o n t a c  t   u s'.toUpperCase()),
                  const SizedBox(
                    height: 15,
                  ),
                  _buildDrawerOptionsText(
                      'p r i v a c y   p o l I c y'.toUpperCase()),
                  const SizedBox(
                    height: 15,
                  ),
                  _buildDrawerOptionsText(
                      'T e r m s  &  c o n d I t I o n s '.toUpperCase()),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 0.2,
              height: 0,
              color: Color(0xff707070),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 34, top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDrawerOptionsText('Rate us'.toUpperCase()),
                  const SizedBox(
                    height: 15,
                  ),
                  _buildDrawerOptionsText('S h a r e   a p p'.toUpperCase()),
                  const SizedBox(
                    height: 15,
                  ),
                  _buildDrawerOptionsText(
                      'Follow us on Facebook'.toUpperCase()),
                  const SizedBox(
                    height: 15,
                  ),
                  _buildDrawerOptionsText(
                      'Follow us on Instagram'.toUpperCase()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  CustomText _buildDrawerOptionsText(String text) {
    return CustomText(
      text: text,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      textColor: FrontEndConfigs.kDrawerOptionsColor,
    );
  }
}
