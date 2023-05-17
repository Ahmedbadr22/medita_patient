import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIconButton extends StatelessWidget {
  const SvgIconButton({
    Key? key,
    this.onPressed,
    required this.svgPath,
  }) : super(key: key);

  final Function()? onPressed;
  final String svgPath;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        svgPath,
        width: 20,
        height: 20,
      ),
      iconSize: 20,
    );
  }
}
