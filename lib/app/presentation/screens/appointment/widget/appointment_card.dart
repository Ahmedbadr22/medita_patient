import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medita_patient/app/data/models/data/appointment/appointment.dart';
import 'package:medita_patient/app/presentation/manager/routes_manager.dart';

import '../../../manager/values_manager.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({
    Key? key,
    required this.appointment,
  }) : super(key: key);

  final Appointment appointment;



  @override
  Widget build(BuildContext context) {

    void navigateToAppointmentDetailScreen() {
      Navigator.pushNamed(context, Routes.appointmentDetailScreenRoute, arguments: appointment);
    }

    return GestureDetector(
      onTap: navigateToAppointmentDetailScreen,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p6),
        child: Card(
          elevation: AppSize.s0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s25),
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppSize.s8),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.all(
                            Radius.circular(AppSize.s20)),
                        child: Image.network(
                          appointment.doctor.user.profileImagePath,
                          height: AppSize.s120,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Theme.of(context).primaryColor,
                            child: SvgPicture.network(
                              appointment.doctor.speciality.iconPath,
                              width: 20,
                              height: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: AppSize.s16),
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
                        Text(
                          appointment.problemDetail,
                          style: const TextStyle(overflow: TextOverflow.ellipsis),
                          maxLines: 2,
                        ),
                        const SizedBox(height: AppSize.s5),
                        Text(appointment.getFormattedDate(context))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
