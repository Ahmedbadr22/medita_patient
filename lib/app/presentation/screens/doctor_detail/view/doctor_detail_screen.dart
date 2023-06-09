import 'package:flutter/material.dart';
import 'package:medita_patient/app/app/extensions.dart';
import 'package:medita_patient/app/presentation/manager/asset_manager.dart';
import 'package:medita_patient/app/presentation/manager/color_manager.dart';
import 'package:medita_patient/app/presentation/manager/string_manager.dart';
import 'package:medita_patient/app/presentation/manager/styles_manager.dart';
import 'package:medita_patient/app/presentation/manager/values_manager.dart';
import 'package:medita_patient/app/presentation/widgets/common_app_bar/common_app_bar.dart';
import 'package:medita_patient/app/presentation/widgets/doctor_detail_card_item/doctor_detail_card_item.dart';
import 'package:medita_patient/app/presentation/widgets/svg_icon_button/svg_icon_button.dart';

import '../../../../data/models/data/doctor/doctor.dart';
import '../../../manager/routes_manager.dart';

class DoctorDetailScreen extends StatelessWidget {
  const DoctorDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Doctor? doctor = ModalRoute.of(context)?.settings.arguments as Doctor;

    void navigateToBookAppointmentScreen() {
      Navigator.pushNamed(context, Routes.bookAppointmentScreenRoute,
          arguments: doctor);
    }

    return Scaffold(
      appBar: commonAppBar(title: "${doctor.user.fullName}"),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: AppSize.s140,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(AppSize.s25)),
                  color: ColorManager.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(AppPadding.p16),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16)),
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
                                    style: const TextStyle(
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  10.ph,
                                  Text(
                                    doctor.hospital.name,
                                    style: const TextStyle(
                                        overflow: TextOverflow.ellipsis),
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
                children: <Widget>[
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
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                    fontSize: 20),
                maxLines: 1,
              ),
              10.ph,
              Text(doctor.about,
                  textAlign: TextAlign.justify,
                  style: getRegularStyle(color: ColorManager.lightBlack)),
              const SizedBox(height: AppSize.s20),
              Text('Working Time',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: ColorManager.darkBlack)),
              const SizedBox(height: AppSize.s10),
              Text(
                ' Monday - Friday, 08:00 AM - 20:00 PM',
                style: getMediumStyle(
                    color: ColorManager.lightBlack, fontSize: AppSize.s14),
              ),
              const SizedBox(height: AppSize.s14),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('Reviews',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: ColorManager.darkBlack)),
                TextButton(
                    onPressed: () {}, child: const Text(StringManager.seeAll))
              ]),
              _reviewsSection(context),
              const SizedBox(height: AppSize.s20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppSize.s30),
              topRight: Radius.circular(AppSize.s30)),
        ),
        height: AppSize.s80,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppSize.s32, vertical: AppSize.s16),
          child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: navigateToBookAppointmentScreen,
                child: const Text("Book Appointment"),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _reviewsSection(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          const CircleAvatar(
            radius: AppSize.s20,
            backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80'),
          ),
          const SizedBox(width: AppSize.s10),
          Text('Asmaa Ahmed',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: ColorManager.darkBlack)),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    width: 60,
                    height: AppSize.s30,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: ColorManager.lightBlue, width: 2),
                        borderRadius:
                            BorderRadiusDirectional.circular(AppSize.s18)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(Icons.star,
                              size: 15, color: ColorManager.lightBlue),
                          Text('5',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: ColorManager.lightBlue)),
                        ])),
                SvgIconButton(
                    onPressed: () {},
                    svgPath: ImageAsset.outlinedMenuDotsCircleSvg),
              ],
            ),
          ),
        ]),
        const SizedBox(height: AppSize.s10),
        const Text(
            maxLines: 3,
            'There are many advantages of online shopping. Firstly, it saves time. With just a couple of clicks of the mouse, you can purchase your shopping orders and instantly move to other important things, which can save time. Second, there is no need for vehicles',
            style: TextStyle(overflow: TextOverflow.ellipsis)),
        Row(
          children: [
            SvgIconButton(
              onPressed: () {},
              svgPath: ImageAsset.outlinedHeartSvg,
            ),
            const Text('868'),
            const SizedBox(width: AppSize.s10),
            const Text(
              '6 days ago',
              style: TextStyle(color: ColorManager.gray),
            ),
          ],
        ),
      ],
    );
  }
}
