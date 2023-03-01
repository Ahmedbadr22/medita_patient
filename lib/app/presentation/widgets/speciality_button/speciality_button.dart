import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medita_patient/app/data/models/data/speciality/speciality.dart';
import 'package:medita_patient/app/presentation/manager/routes_manager.dart';
import '../../manager/values_manager.dart';

class SpecialityButton extends StatelessWidget {
  const SpecialityButton({
    Key? key,
    required this.speciality
  }) : super(key: key);

  final Speciality speciality;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s50),
            color: Theme
                .of(context)
                .primaryColor
                .withOpacity(0.1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p4),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(
                    context,
                    Routes.specialityRoute,
                    arguments: speciality
                );
              },
              icon: SvgPicture.network(
                speciality.iconPath,
                color: Theme
                    .of(context)
                    .primaryColor,
              ),
            ),
          ),
        ),
        const SizedBox(height: AppSize.s10),
        Text(
          speciality.name,
          style: const TextStyle(
            fontSize: 12,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
