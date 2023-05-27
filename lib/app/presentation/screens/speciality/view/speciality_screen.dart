import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medita_patient/app/app/extensions.dart';
import 'package:medita_patient/app/data/models/data/doctor/doctor.dart';
import 'package:medita_patient/app/presentation/screens/speciality/cubit/SpecialityScreenCubit.dart';
import 'package:medita_patient/app/presentation/screens/speciality/cubit/SpecialityScreenState.dart';
import 'package:medita_patient/app/presentation/widgets/doctor_card/main_doctor_card.dart';
import 'package:medita_patient/app/presentation/widgets/loading/loading_list.dart';

import '../../../../data/models/data/speciality/speciality.dart';
import '../../../widgets/loading/doctor_card_shimmer.dart';

class SpecialityScreen extends StatelessWidget {
  const SpecialityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Speciality? speciality = ModalRoute.of(context)?.settings.arguments as Speciality;

    SpecialityScreenCubit cubit = SpecialityScreenCubit.get(context);
    cubit.listDoctorsBySpecialityId(speciality.id);

    Widget doctorCardItemBuilder(_, int index) {
      Doctor doctor = cubit.doctors[index];
      return DoctorCard(doctor: doctor);
    }

    return BlocConsumer<SpecialityScreenCubit, SpecialityScreenState>(
      listener: (_, __) {},
      builder: (_, __) {
        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: specialityAppBar(
            title: Row(
              children: <Widget>[
                SvgPicture.network(
                  speciality.iconPath,
                  color: Theme.of(context).primaryColor,
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
                10.pw,
                Text(speciality.name)
              ],
            ),
          ),
          body: Visibility(
            visible: cubit.isLoading,
            replacement: cubit.doctors.isEmpty
                ? const Center(
                    child: Text("0 Doctor Found"),
                  )
                : ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemCount: cubit.doctors.length,
                    itemBuilder: doctorCardItemBuilder,
                    separatorBuilder: (_, __) {
                      return 10.ph;
                    },
                  ),
            child: const LoadingList(
              shimmerItem: DoctorCardShimmer(),
              itemCount: 5,
            ),
          ),
        );
      },
    );
  }

  AppBar specialityAppBar({
    required Widget title,
    bool isCenteredTitle = false,
    List<Widget>? actions,
  }) {
    return AppBar(title: title, centerTitle: false, actions: actions);
  }
}
