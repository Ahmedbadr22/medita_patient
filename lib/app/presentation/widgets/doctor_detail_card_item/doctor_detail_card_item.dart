import 'package:flutter/material.dart';
import 'package:medita_patient/app/app/extensions.dart';

import '../../manager/values_manager.dart';

class DoctorDetailCardItem extends StatelessWidget {
  const DoctorDetailCardItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s50),
            color: Theme.of(context).primaryColor.withOpacity(0.1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p16),
            child: Icon(
              icon,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        10.ph,
        Text(
          title,
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis),
        ),
        5.ph,
        Text(
          subtitle,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
