import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medita_patient/app/app/extensions.dart';
import 'package:medita_patient/app/presentation/manager/asset_manager.dart';
import 'package:medita_patient/app/presentation/screens/near_hospitals_screen/cubit/near_hospitals_screen_cubit.dart';
import 'package:medita_patient/app/presentation/screens/near_hospitals_screen/cubit/near_hospitals_screen_states.dart';
import 'package:medita_patient/app/presentation/widgets/svg_icon_button/svg_icon_button.dart';

import '../../../../data/models/data/hospital/hospital.dart';
import '../../../widgets/common_app_bar/common_app_bar.dart';
import '../../../widgets/hospital_card_item/hospital_card_item.dart';
import '../../../widgets/loading/doctor_card_shimmer.dart';
import '../../../widgets/loading/loading_list.dart';


class NearHospitalsScreen extends StatelessWidget {
  const NearHospitalsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NearHospitalsScreenCubit nearHospitalsScreenCubit = NearHospitalsScreenCubit.get(context);

    var size = MediaQuery.of(context).size;

    /// This function build the HospitalCardItem and return it
    /// by passing the [position] of the item
    /// and return the [HospitalCardItem] widget
    HospitalCardItem hospitalCardItemBuilder(_, int position) {
      Hospital hospital = nearHospitalsScreenCubit.hospitals[position];
      return HospitalCardItem(hospital: hospital, size: size,);
    }

    return BlocConsumer<NearHospitalsScreenCubit, NearHospitalsScreenState>(
        listener: (_, __) {},
        builder: (_, __) {
          return Scaffold(
            appBar: commonAppBar(
              title: "Near Hospitals",
              actions: <SvgIconButton> [
                SvgIconButton(
                  onPressed: () {},
                  svgPath: ImageAsset.outlinedMagnifierSvg,
                ),
                SvgIconButton(
                  onPressed: () {},
                  svgPath: ImageAsset.outlinedMenuDotsCircleSvg,
                ),
              ]
            ),
            body: Visibility(
              visible: !nearHospitalsScreenCubit.isLoading,
              replacement: const LoadingList(
                shimmerItem: DoctorCardShimmer(),
                itemCount: 5,
              ),
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: nearHospitalsScreenCubit.hospitals.length,
                itemBuilder: hospitalCardItemBuilder,
                separatorBuilder: _buildCardItemSeparator,
              ),
            ),
          );
        });
  }

  SizedBox _buildCardItemSeparator(_, __) => 10.ph;

}
