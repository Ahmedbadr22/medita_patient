import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medita_patient/app/presentation/manager/color_manager.dart';
import 'package:medita_patient/app/presentation/manager/values_manager.dart';

class SocialAuthenticationButton extends StatelessWidget {
  const SocialAuthenticationButton({
    Key? key,
    required this.platformName,
    required this.iconPath,
  }) : super(key: key);

  final String platformName;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(AppSize.s14),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              iconPath,
              height: 30,
            ),
            const SizedBox(width: AppSize.s8),
            Text(
              "Continue with $platformName",
              style: const TextStyle(color: ColorManager.darkBlack),
            ),
          ],
        ),
      ),
    );
  }
}
