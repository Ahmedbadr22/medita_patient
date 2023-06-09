import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../data/models/ui/on_boarding_data_model.dart';
import '../../manager/color_manager.dart';
import '../../manager/values_manager.dart';

class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem({
    Key? key,
    required this.onBoardingDataModel,
  }) : super(key: key);

  final OnBoardingPageItemData onBoardingDataModel;

  Widget getImage(String path) {
    if (path.contains('.svg')) {
      return SvgPicture.asset(path);
    } else {
      return Image.asset(path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: <Expanded>[
          Expanded(
            flex: 3,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
                child: getImage(onBoardingDataModel.imagePath),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    onBoardingDataModel.title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(color: ColorManager.darkBlack),
                  ),
                  Text(
                    onBoardingDataModel.text,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
