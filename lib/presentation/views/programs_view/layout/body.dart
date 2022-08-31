import 'package:flutter/material.dart';

import '../../../../configurations/front_end.dart';
import '../../../routes/route_names.dart';
import 'widgets/program_card.dart';

class ProgramsViewBody extends StatelessWidget {
  const ProgramsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FrontEndConfigs.kScaffoldColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                      context, RouteNames.programDetailsViewRoute);
                },
                child: const ProgramCard()),
            const ProgramCard(),
          ],
        ),
      ),
    );
  }
}
