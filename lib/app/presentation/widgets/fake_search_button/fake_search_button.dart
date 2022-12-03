import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medita_patient/app/presentation/manager/asset_manager.dart';
import 'package:medita_patient/app/presentation/manager/string_manager.dart';

import '../../manager/color_manager.dart';

class FakeSearchButton extends StatelessWidget {
  const FakeSearchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: ColorManager.gray.withOpacity(0.2),
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget> [
              Row(
                children: <Widget> [
                  SvgPicture.asset(ImageAsset.outlinedMagnifierSvg),
                  const SizedBox(width: 10,),
                  const Text(StringManager.search)
                ],
              ),
              const Icon(Icons.filter_list)
            ],
          ),
        ),
      ),
      onTap: (){},
    );
  }
}
