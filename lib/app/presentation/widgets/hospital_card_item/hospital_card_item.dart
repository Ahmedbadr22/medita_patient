import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medita_patient/app/data/models/data/hospital/hospital.dart';
import 'package:medita_patient/app/presentation/manager/asset_manager.dart';
import 'package:medita_patient/app/presentation/manager/color_manager.dart';
import 'package:medita_patient/app/presentation/widgets/svg_icon_button/svg_icon_button.dart';
import '../../manager/values_manager.dart';

class HospitalCardItem extends StatelessWidget {
  const HospitalCardItem({
    Key? key,
    required this.hospital,
  }) : super(key: key);

  final Hospital hospital;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                    hospital.imageUrl,
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
                              hospital.name,
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
                      Row(
                        children: [
                          Text("Location : ${hospital.location}"),
                        ],
                      ),
                      const SizedBox(height: AppSize.s5),
                      Row(
                        children: <Widget>[
                          SvgPicture.asset(
                            ImageAsset.filledStareSvg,
                            color: ColorManager.gold,
                          ),
                          const SizedBox(width: AppSize.s5),
                          Text(hospital.rates.isEmpty ? "0.0" : hospital.rates.length.toString()),
                          const SizedBox(width: AppSize.s5),
                          Text("(${hospital.rates.length} reviews)"),
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
    );
  }
}
