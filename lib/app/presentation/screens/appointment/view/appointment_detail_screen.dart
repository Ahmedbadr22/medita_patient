import 'package:flutter/material.dart';
import 'package:medita_patient/app/app/extensions.dart';
import 'package:medita_patient/app/data/models/data/appointment/appointment.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../manager/values_manager.dart';
import '../../../widgets/common_app_bar/common_app_bar.dart';

class AppointmentDetailScreen extends StatelessWidget {
  const AppointmentDetailScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    Appointment appointment = ModalRoute.of(context)?.settings.arguments as Appointment;

    void openMeetingUri() async {
      String url = appointment.meetingLink;
      Uri uri = Uri.parse(url);
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }

    return Scaffold(
      appBar: commonAppBar(title: "My Appointment"),
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
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(AppPadding.p16),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(16)),
                          child: Image.network(
                            appointment.doctor.user.profileImagePath,
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
                              "Dr.${appointment.doctor.user.fullName}",
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
                                    appointment.doctor.speciality.name,
                                    style: const TextStyle(overflow: TextOverflow.ellipsis),
                                  ),
                                  10.ph,
                                  Text(
                                    appointment.doctor.hospital.name,
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
              Text(
                "Scheduled Appointment",
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
              Text(appointment.getNamedDate()),
              10.ph,
              Text("${appointment.getTime(context)} (60 minutes) Meeting"),
              40.ph,
              Text(
                "Problem Detail",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                    fontSize: 20,
                ),
                maxLines: 1,
              ),
              10.ph,
              Text(appointment.problemDetail),
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
                onPressed: openMeetingUri,
                child: const Text("Open Meeting"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
