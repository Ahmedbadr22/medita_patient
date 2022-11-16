import 'package:flutter/material.dart';

import '../../manager/color_manager.dart';
import '../../manager/string_manager.dart';
import '../../manager/values_manager.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p16),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s16),
        ),
        color: ColorManager.lightBlue,
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Medical Checks!",
                style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: ColorManager.white),
              ),
              Text(
                "Check your health condition regularly to minimize the incidence of of disease in the future",
                style: Theme
                    .of(context)
                    .textTheme
                    .caption
                    ?.copyWith(color: Colors.white),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.white,
                    foregroundColor: Theme
                        .of(context)
                        .primaryColor,
                    elevation: AppSize.s0
                ),
                child: const Text(StringManager.checkNow),
              )
            ],
          ),
        ),
      ),
    );
  }
}
