import 'package:flutter/material.dart';
import 'package:medita_patient/app/presentation/manager/string_manager.dart';
import 'package:medita_patient/app/presentation/manager/values_manager.dart';
import 'package:medita_patient/app/presentation/widgets/hospital_card_item/hospital_card_item.dart';

class NearHospitalsScreen extends StatelessWidget {
  const NearHospitalsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringManager.nearHospitals),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz),
          ),
        ],
      ),
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
}
