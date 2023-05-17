import 'package:flutter/material.dart';
import 'package:medita_patient/app/data/models/data/speciality/speciality.dart';
import 'package:medita_patient/app/presentation/manager/values_manager.dart';

import 'package:medita_patient/app/presentation/widgets/common_app_bar/common_app_bar.dart';

import '../../../widgets/speciality_button/speciality_button.dart';

class SpecialitiesScreen extends StatelessWidget {
  const SpecialitiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final specialities = ((ModalRoute.of(context)?.settings.arguments) ?? <Speciality>[]) as List<Speciality>;

    SpecialityButton specialtyItemBuilder(_, int index) {
      Speciality speciality = specialities[index];
      return SpecialityButton(speciality: speciality);
    }

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: commonAppBar(title: "Specialities"),
      body: Padding(
        padding: const EdgeInsets.all(AppSize.s16),
        child: SizedBox(
          child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 4.0,
              ),
              itemCount: specialities.length,
              itemBuilder: specialtyItemBuilder)
        ),
      ),
    );
  }
}
