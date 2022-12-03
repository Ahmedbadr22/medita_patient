import 'package:flutter/material.dart';
import 'package:medita_patient/app/presentation/manager/asset_manager.dart';
import 'package:medita_patient/app/presentation/manager/string_manager.dart';
import 'package:medita_patient/app/presentation/manager/values_manager.dart';
import 'package:medita_patient/app/presentation/widgets/hospital_card_item/hospital_card_item.dart';
import 'package:medita_patient/app/presentation/widgets/svg_icon_button/svg_icon_button.dart';

class NearHospitalsScreen extends StatelessWidget {
  const NearHospitalsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: nearHospitalsAppBar(),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: _buildHospitalCardItem,
        separatorBuilder: _buildCardItemSeparator,
      ),
    );
  }

  HospitalCardItem _buildHospitalCardItem(_, int index) => const HospitalCardItem();
  SizedBox _buildCardItemSeparator(_, __) => const SizedBox(height: AppSize.s10,);

  AppBar nearHospitalsAppBar() {
    return AppBar(
      title: const Text(StringManager.nearHospitals),
      centerTitle: true,
      actions: <SvgIconButton> [
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
