import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../backend/models/program_model.dart';
import '../../../../backend/services/system.dart';
import '../../../../configurations/front_end.dart';
import '../../../elements/custom_text.dart';
import '../../../routes/route_names.dart';
import 'widgets/program_card.dart';

class ProgramsViewBody extends StatelessWidget {
  const ProgramsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      initialData: [ProgramModel()],
      value: SystemServices().fetchAllPrograms(),
      builder: (context, child) {
        List<ProgramModel> _allProgramsList =
            context.watch<List<ProgramModel>>();
        if (_allProgramsList.isEmpty) {
          return const SizedBox(
            height: 300,
            width: double.infinity,
            child: Center(
              child: CustomText(
                text: 'NO Programs Uploaded',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                textColor: FrontEndConfigs.kPrimaryColor,
              ),
            ),
          );
        } else {
          return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: _allProgramsList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                        context, RouteNames.programDetailsViewRoute,
                        arguments: _allProgramsList[index]);
                  },
                  child: ProgramCard(
                      imagePath: _allProgramsList[index].programImage ??
                          'https://i.pinimg.com/originals/f9/11/d3/f911d38579709636499618b6b3d9b6f6.jpg',
                      title: _allProgramsList[index].programTitle ?? '',
                      description:
                          _allProgramsList[index].programDescription ?? '',
                      date: _allProgramsList[index].programDate ?? ''),
                );
              });
        }
      },
    );
  }
}
