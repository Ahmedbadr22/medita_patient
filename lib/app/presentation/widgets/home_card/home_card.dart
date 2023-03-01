import 'package:flutter/material.dart';
import 'package:medita_patient/app/data/models/data/banner/banner.dart';

import '../../manager/color_manager.dart';
import '../../manager/string_manager.dart';
import '../../manager/values_manager.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({Key? key, required this.banner }) : super(key: key);

  final MedicalBanner banner;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s16)),
        child: Stack(
          children: <Widget> [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(AppSize.s16)),
              child: Image.network(
                banner.imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: ColorManager.darkBlack.withOpacity(0.4),
                borderRadius: const BorderRadius.all(Radius.circular(AppSize.s16)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppPadding.p16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    banner.title,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: ColorManager.white),
                  ),
                  Text(
                    banner.body,
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        ?.copyWith(color: Colors.white),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManager.white,
                        foregroundColor: Theme.of(context).primaryColor,
                        elevation: AppSize.s0,
                    ),
                    child: const Text(StringManager.checkNow),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
