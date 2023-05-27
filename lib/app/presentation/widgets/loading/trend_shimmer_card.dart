import 'package:flutter/material.dart';
import 'package:medita_patient/app/app/extensions.dart';


import '../../manager/values_manager.dart';
import 'loading_shimmer.dart';

class TrendShimmerCard extends StatelessWidget {
  const TrendShimmerCard({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: SizedBox(
        height: AppSize.s200,
        width: AppSize.s210,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(AppSize.s20)),
              child: LoadingShimmer(
                height: AppSize.s120,
                width: double.infinity,
                borderRadius: AppSize.s10,
              ),
            ),
            8.ph,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LoadingShimmer(
                    height: AppSize.s15,
                    width: double.infinity,
                    borderRadius: AppSize.s5,
                  ),
                  5.ph,
                  Row(
                    children: <Widget>[
                      const LoadingShimmer(
                        height: AppSize.s10,
                        width: AppSize.s50,
                        borderRadius: AppSize.s5,
                      ),
                      10.pw,
                      const LoadingShimmer(
                        height: AppSize.s10,
                        width: AppSize.s50,
                        borderRadius: AppSize.s5,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
