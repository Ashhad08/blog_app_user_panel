import 'package:flutter/material.dart';

import '../../../../configurations/front_end.dart';
import '../../../elements/custom_text.dart';
import 'widgets/spotlight_user_card.dart';

class SpotlightViewBody extends StatelessWidget {
  const SpotlightViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FrontEndConfigs.kScaffoldColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(
              height: 22,
            ),
            Padding(
              padding: EdgeInsets.only(left: 19),
              child: CustomText(
                  text: 'In the Spotlight',
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            SpotlightUserCard(),
            SpotlightUserCard(),
          ],
        ),
      ),
    );
  }
}
