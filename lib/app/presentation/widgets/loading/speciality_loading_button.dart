import 'package:flutter/material.dart';
import 'package:medita_patient/app/presentation/widgets/loading/loading_shimmer.dart';
import '../../manager/values_manager.dart';

class SpecialityLoadingButton extends StatelessWidget {
  const SpecialityLoadingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        LoadingShimmer(
          borderRadius: AppSize.s50,
          height: AppSize.s50,
          width: AppSize.s50,
        ),
        SizedBox(height: AppSize.s10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: LoadingShimmer(
            borderRadius: AppSize.s50,
            height: AppSize.s10,
            width: double.infinity,
          ),
        )
      ],
    );
  }
}
