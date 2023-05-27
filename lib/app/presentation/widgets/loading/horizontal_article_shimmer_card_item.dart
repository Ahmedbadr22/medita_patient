import 'package:flutter/material.dart';
import 'package:medita_patient/app/app/extensions.dart';

import '../../manager/values_manager.dart';
import '../loading/loading_shimmer.dart';

class HorizontalArticleShimmerCardItem extends StatelessWidget {
  const HorizontalArticleShimmerCardItem({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          const Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(AppSize.s20)),
              child: LoadingShimmer(height: AppSize.s100, width: AppSize.s100),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LoadingShimmer(height: AppSize.s20, width: double.infinity),
                  2.ph,
                  Row(
                    children: <Widget> [
                      const LoadingShimmer(height: AppSize.s10, width: AppSize.s70),
                      10.pw,
                      const LoadingShimmer(height: AppSize.s10, width: AppSize.s30),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
