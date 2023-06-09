import 'package:flutter/material.dart';
import 'package:medita_patient/app/presentation/manager/values_manager.dart';
import 'package:medita_patient/app/presentation/widgets/loading/loading_shimmer.dart';

class DoctorCardShimmer extends StatelessWidget {
  const DoctorCardShimmer({super.key});

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
              const Expanded(
                flex: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(AppSize.s20)),
                  child: LoadingShimmer(
                    height: AppSize.s120,
                    width: AppSize.s120,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: AppSize.s16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const <Widget>[
                          Expanded(
                            flex: 2,
                            child: LoadingShimmer(
                              height: AppSize.s15,
                              width: AppSize.s50,
                              borderRadius: AppSize.s5,
                            ),
                          ),
                          SizedBox(width: AppSize.s10),
                          Expanded(
                            child: LoadingShimmer(
                              height: AppSize.s15,
                              width: AppSize.s20,
                              borderRadius: AppSize.s5,
                            ),
                          )
                        ],
                      ),
                      Divider(),
                      LoadingShimmer(
                        height: AppSize.s10,
                        width: AppSize.s30,
                        borderRadius: AppSize.s5,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      LoadingShimmer(
                        height: AppSize.s10,
                        width: double.infinity,
                        borderRadius: AppSize.s5,
                      ),
                      SizedBox(height: AppSize.s5),
                      Row(
                        children: <Widget>[
                          LoadingShimmer(
                            height: AppSize.s20,
                            width: AppSize.s20,
                            borderRadius: AppSize.s5,
                          ),
                          SizedBox(width: AppSize.s5),
                          LoadingShimmer(
                            height: AppSize.s10,
                            width: AppSize.s50,
                            borderRadius: AppSize.s5,
                          ),
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
