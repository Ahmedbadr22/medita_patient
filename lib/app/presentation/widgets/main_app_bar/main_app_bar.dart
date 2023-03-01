import 'package:flutter/material.dart';

import '../../manager/asset_manager.dart';
import '../../manager/routes_manager.dart';
import '../../manager/string_manager.dart';
import '../../manager/values_manager.dart';
import '../svg_icon_button/svg_icon_button.dart';

AppBar mainAppBar(BuildContext context) {
  return AppBar(
    titleSpacing: AppSize.s16,
    automaticallyImplyLeading: false,
    title: Row(
      children: <Widget>[
        const CircleAvatar(
          backgroundImage: NetworkImage(
            "https://lovehairstyles.com/wp-content/uploads/2022/05/tp-best-mens-hairstyles.jpg",
          ),
          radius: AppSize.s25,
        ),
        const SizedBox(width: AppSize.s10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Text>[
            Text(
              StringManager.goodMorning,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const Text("Ahmed Badr"),
          ],
        ),
      ],
    ),
    actions: <SvgIconButton>[
      SvgIconButton(
        svgPath: ImageAsset.outlinedBellSvg,
        onPressed: (){

        },
      ),
      SvgIconButton(
        svgPath: ImageAsset.outlinedHeartSvg,
        onPressed: (){},
      ),
    ],
  );
}
