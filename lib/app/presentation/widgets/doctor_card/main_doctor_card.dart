import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medita_patient/app/data/models/data/doctor/doctor.dart';
import 'package:medita_patient/app/presentation/manager/routes_manager.dart';

import '../../manager/asset_manager.dart';
import '../../manager/color_manager.dart';
import '../../manager/values_manager.dart';
import '../svg_icon_button/svg_icon_button.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({
    Key? key,
    required this.doctor,
  }) : super(key: key);

  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.doctorDetailRoute, arguments: doctor);
      },
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
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(AppSize.s20)),
                    child: Image.network(
                      doctor.user.profileImagePath,
                      height: AppSize.s120,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: AppSize.s16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: Text(
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
                            ),
                            SvgIconButton(
                              svgPath: ImageAsset.outlinedHeartSvg,
                              onPressed: () {},
                            )
                          ],
                        ),
                        const Divider(),
                        Text(
                          "${doctor.speciality.name} | ${doctor.hospital.name}",
                          style: const TextStyle(overflow: TextOverflow.ellipsis),
                        ),
                        const SizedBox(height: AppSize.s5),
                        Row(
                          children: <Widget>[
                            SvgPicture.asset(
                              ImageAsset.filledStareSvg,
                              color: ColorManager.gold,
                            ),
                            const SizedBox(width: AppSize.s5),
                            const Text("0.0"),
                            const SizedBox(width: AppSize.s5),
                            const Text("(0 reviews)"),
                          ],
                        )
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