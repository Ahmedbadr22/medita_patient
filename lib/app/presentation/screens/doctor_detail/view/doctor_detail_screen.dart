import 'package:flutter/material.dart';
import 'package:medita_patient/app/app/extensions.dart';
import 'package:medita_patient/app/presentation/manager/values_manager.dart';
import 'package:medita_patient/app/presentation/widgets/common_app_bar/common_app_bar.dart';
import 'package:medita_patient/app/presentation/widgets/doctor_detail_card_item/doctor_detail_card_item.dart';

import '../../../../data/models/data/doctor/doctor.dart';
import '../../../manager/routes_manager.dart';

class DoctorDetailScreen extends StatelessWidget {
  const DoctorDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Doctor? doctor = ModalRoute.of(context)?.settings.arguments as Doctor;

    return Scaffold(
      appBar: commonAppBar(title: "Dr.${doctor.user.fullName}"),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 140,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(AppPadding.p16),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(16)),
                          child: Image.network(
                            doctor.user.profileImagePath,
                            height: AppSize.s120,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      15.pw,
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              doctor.user.fullName,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                              maxLines: 1,
                            ),
                            const Divider(),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    doctor.speciality.name,
                                    style: const TextStyle(overflow: TextOverflow.ellipsis),
                                  ),
                                  10.ph,
                                  Text(
                                    doctor.hospital.name,
                                    style: const TextStyle(overflow: TextOverflow.ellipsis),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              20.ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget> [
                  const DoctorDetailCardItem(
                    title: "+5,000",
                    subtitle: "patients",
                    icon: Icons.people,
                  ),
                  DoctorDetailCardItem(
                    title: doctor.yearsOfExp.toString(),
                    subtitle: "year of exp",
                    icon: Icons.insert_chart_outlined,
                  ),
                  const DoctorDetailCardItem(
                    title: "4.8",
                    subtitle: "rating",
                    icon: Icons.star_half,
                  ),
                  const DoctorDetailCardItem(
                    title: "4,942",
                    subtitle: "reviews",
                    icon: Icons.message,
                  ),
                ],
              ),
              30.ph,
              Text(
                "About me",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                  fontSize: 20
                ),
                maxLines: 1,
              ),
              10.ph,
              Text(doctor.about)
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: 80,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
          child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: ElevatedButton(
                child: const Text("Book Appointment"),
                onPressed: () {
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
