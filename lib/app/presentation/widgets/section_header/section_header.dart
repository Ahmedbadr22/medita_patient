import 'package:flutter/material.dart';

import '../../manager/string_manager.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    Key? key,
    required this.title,
    required this.buttonText,
    required this.onClick
  }) : super(key: key);

  final String title;
  final String buttonText;
  final void Function()? onClick;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        TextButton(
          onPressed: onClick,
          child: Text(buttonText),
        )
      ],
    );
  }
}
