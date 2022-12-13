import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medita_patient/api/models/hospital_model.dart';
import 'package:medita_patient/app/data/models/data/hospital/hospital.dart';
import 'package:medita_patient/app/presentation/manager/asset_manager.dart';
import 'package:medita_patient/app/presentation/manager/color_manager.dart';
import 'package:medita_patient/app/presentation/manager/values_manager.dart';
import 'package:medita_patient/app/presentation/widgets/svg_icon_button/svg_icon_button.dart';

class HospitalItem extends StatelessWidget {
  const HospitalItem({
    required this.listOfHospitals,
    Key? key,
  }) : super(key: key);
  final List<HospitalDataModel> listOfHospitals;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: listOfHospitals.length,
      itemBuilder: (context, index) => Padding(
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
                    borderRadius:
                        const BorderRadius.all(Radius.circular(AppSize.s20)),
                    child: Image.network(
                      listOfHospitals[index].image,
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
                                listOfHospitals[index].name,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                                maxLines: 2,
                              ),
                            ),
                            SvgIconButton(
                              svgPath: ImageAsset.outlinedHeartSvg,
                              onPressed: () {},
                            )
                          ],
                        ),
                        const Divider(),
                        Text("Location : ${listOfHospitals[index].location}"),
                        const SizedBox(height: AppSize.s5),
                        Row(
                          children: <Widget>[
                            SvgPicture.asset(
                              ImageAsset.filledStareSvg,
                              color: ColorManager.gold,
                            ),
                            const SizedBox(width: AppSize.s5),
                            Text(listOfHospitals[index].rates.isEmpty
                                ? "0.0"
                                : listOfHospitals[index]
                                    .rates
                                    .length
                                    .toString()),
                            const SizedBox(width: AppSize.s5),
                            Text(
                                "(${listOfHospitals[index].rates.length} reviews)"),
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
