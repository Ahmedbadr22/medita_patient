import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medita_patient/app/presentation/manager/asset_manager.dart';
import 'package:medita_patient/app/presentation/manager/color_manager.dart';
import 'package:medita_patient/app/presentation/manager/string_manager.dart';
import 'package:medita_patient/app/presentation/widgets/svg_icon_button/svg_icon_button.dart';
import '../../manager/values_manager.dart';

class HospitalCardItem extends StatelessWidget {
  const HospitalCardItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      child: Card(
        elevation: AppSize.s0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s25),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSize.s16),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.all(Radius.circular(AppSize.s20)),
                  child: Image.network(
                    "https://www.templehealth.org/sites/default/files/styles/full_width_image/public/temple-university-hospital-jeanes-campus-entrance-1.jpg?itok=51S1CrQd",
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
                          Text(
                            StringManager.hospitalName,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SvgIconButton(
                            svgPath: ImageAsset.outlinedHeartSvg,
                            onPressed: () {},
                          )
                        ],
                      ),
                      const Divider(),
                      Row(
                        children: const <Chip> [
                          Chip(label: Text("Dental")),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          SvgPicture.asset(
                            ImageAsset.filledStareSvg,
                            color: ColorManager.gold,
                          ),
                          const SizedBox(
                            width: AppSize.s5,
                          ),
                          const Text("4.3"),
                          const SizedBox(width: AppSize.s5),
                          const Text("(5,376 reviews)"),
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
