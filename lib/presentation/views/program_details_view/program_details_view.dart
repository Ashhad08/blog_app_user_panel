import 'package:flutter/material.dart';

import '../../../backend/models/program_model.dart';
import '../../../configurations/front_end.dart';
import '../../elements/custom_text.dart';
import 'layout/body.dart';

class ProgramDetailsView extends StatelessWidget {
  final ProgramModel _programDetails;

  const ProgramDetailsView(this._programDetails, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FrontEndConfigs.kScaffoldDefaultColor,
      appBar: AppBar(
        title: const CustomText(
            text: 'Programs Details',
            fontSize: 14,
            fontWeight: FontWeight.bold),
        actions: [
          IconButton(
            splashRadius: 25,
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              size: 25,
            ),
          ),
          const SizedBox(
            width: 15,
          )
        ],
      ),
      body: ProgramDetailsViewBody(
        _programDetails,
      ),
    );
  }
}
