import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../manager/values_manager.dart';

class IconAuthenticationButton extends StatelessWidget {
  const IconAuthenticationButton({Key? key, required this.iconPath}) : super(key: key);

  final String iconPath;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSize.s80,
      height: AppSize.s50,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s14))
        ),
        child: SvgPicture.asset(iconPath, height: AppSize.s25,),
      ),
    );
  }
}
