import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medita_patient/app/data/models/data/hospital/hospital.dart';
import 'package:medita_patient/app/presentation/manager/asset_manager.dart';
import 'package:medita_patient/app/presentation/manager/color_manager.dart';
import '../../manager/values_manager.dart';
import '../loading/loading_shimmer.dart';

class HospitalCardItem extends StatelessWidget {
  const HospitalCardItem({Key? key, required this.hospital, required this.size})
      : super(key: key);

  final Hospital hospital;
  final Size size;

  Widget loadingItemBuilder(BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
    if (loadingProgress == null) return child;
    return const LoadingShimmer(
      width: AppSize.s130,
      height: AppSize.s130,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p6),
      child: SizedBox(
        height: 150,
        width: size.width,
        child: Card(
          elevation: AppSize.s0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s25)),
          child: Padding(
            padding: const EdgeInsets.all(AppSize.s8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.all(Radius.circular(AppSize.s20)),
                  child: Image.network(
                    hospital.imageUrl,
                    height: AppSize.s120,
                    fit: BoxFit.cover,
                    width: AppSize.s130,
                    loadingBuilder: loadingItemBuilder,
                  ),
                ),
                Container(
                  width: size.width - 166,
                  padding: const EdgeInsets.only(left: AppSize.s16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        hospital.name,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
                        maxLines: 2,
                      ),
                      const Divider(),
                      Text(
                        hospital.location,
                        maxLines: 2,
                      ),
                      const SizedBox(height: AppSize.s5),
                      Row(
                        children: <Widget>[
                          SvgPicture.asset(
                            ImageAsset.filledStareSvg,
                            color: ColorManager.gold,
                          ),
                          const SizedBox(width: AppSize.s5),
                          Text(hospital.rates.isEmpty
                              ? "0.0"
                              : hospital.rates.length.toString()),
                          const SizedBox(width: AppSize.s5),
                          Text("(${hospital.rates.length} reviews)"),
                        ],
                      )
                    ],
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
