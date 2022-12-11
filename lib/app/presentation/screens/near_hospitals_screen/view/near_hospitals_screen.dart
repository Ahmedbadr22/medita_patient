import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medita_patient/app/presentation/manager/asset_manager.dart';
import 'package:medita_patient/app/presentation/manager/string_manager.dart';
import 'package:medita_patient/app/presentation/manager/values_manager.dart';
import 'package:medita_patient/app/presentation/screens/near_hospitals_screen/cubit/near_hospitals_screen_cubit.dart';
import 'package:medita_patient/app/presentation/screens/near_hospitals_screen/cubit/near_hospitals_screen_states.dart';
import 'package:medita_patient/app/presentation/widgets/svg_icon_button/svg_icon_button.dart';


class NearHospitalsScreen extends StatelessWidget {
  const NearHospitalsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NearHospitalsScreenCubit nearHospitalsScreenCubit = NearHospitalsScreenCubit.get(context);

    return BlocConsumer<NearHospitalsScreenCubit, NearHospitalsScreenState>(
        listener: (_, __) {},
        builder: (_, __) {
          return Scaffold(
            appBar: nearHospitalsAppBar(),
            body: Visibility(
              visible: !nearHospitalsScreenCubit.isLoading,
              replacement: const Center(child: CircularProgressIndicator()),
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: nearHospitalsScreenCubit.hospitals.length,
                itemBuilder: nearHospitalsScreenCubit.hospitalCardItemBuilder,
                separatorBuilder: _buildCardItemSeparator,
              ),
            ),
          );
        });
  }

  SizedBox _buildCardItemSeparator(_, __) => const SizedBox(height: AppSize.s10);

  AppBar nearHospitalsAppBar() {
    return AppBar(
      title: const Text(StringManager.nearHospitals),
      centerTitle: true,
      actions: <SvgIconButton>[
        SvgIconButton(
          onPressed: () {},
          svgPath: ImageAsset.outlinedMagnifierSvg,
        ),
        SvgIconButton(
          onPressed: () {},
          svgPath: ImageAsset.outlinedMenuDotsCircleSvg,
        ),
      ],
    );
  }
}
