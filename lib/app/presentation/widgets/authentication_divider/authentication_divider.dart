import 'package:flutter/material.dart';

import '../../manager/values_manager.dart';

class AuthenticationDivider extends StatelessWidget {
  const AuthenticationDivider({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  <Widget>[
        const Expanded(child: Divider()),
        const SizedBox(width: AppSize.s20),
        Text(text),
        const SizedBox(width: AppSize.s20),
        const Expanded(child: Divider()),
      ],
    );
  }
}
