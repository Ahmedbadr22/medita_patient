import 'package:flutter/material.dart';
import '../../manager/values_manager.dart';

class SpecialityButton extends StatelessWidget {
  const SpecialityButton({Key? key, required this.title, required this.icon})
      : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s50),
              color: Theme.of(context).primaryColor.withOpacity(0.2)),
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p4),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                icon,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: AppSize.s10,
        ),
        Text(title)
      ],
    );
  }
}
