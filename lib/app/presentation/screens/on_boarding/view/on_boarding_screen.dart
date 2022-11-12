import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medita_patient/app/data/models/on_boarding_screen_object.dart';
import 'package:medita_patient/app/presentation/manager/asset_manager.dart';
import 'package:medita_patient/app/presentation/manager/string_manager.dart';
import 'package:medita_patient/app/presentation/manager/values_manager.dart';
import 'package:medita_patient/app/presentation/screens/on_boarding/view_model/on_boarding_view_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../data/models/on_boarding_data_model.dart';
import '../../../widgets/on_boarding_item/on_boarding_item.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final OnBoardingViewModel _viewModel = OnBoardingViewModel();
  final PageController _onBoardingPageController = PageController();

  @override
  void initState() {
    super.initState();
    _viewModel.start();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _viewModel.outputOnBoardingScreenObject,
      builder: (BuildContext context, AsyncSnapshot<OnBoardingScreenObject> onBoardingScreenObjectSnapshot) {
        return _getScreenContent(onBoardingScreenObjectSnapshot.data);
      },
    );
  }

  Widget _getScreenContent(OnBoardingScreenObject? onBoardingScreenObject) {
    if(onBoardingScreenObject == null) {
      return Container();
    } else {
      return Scaffold(
        appBar: AppBar(
          title: SvgPicture.asset(
            ImageAsset.blackLogoImagePath,
            height: AppSize.s130,
          ),
          centerTitle: false,
          actions: <TextButton>[
            TextButton(
              onPressed: () {
                // TODO: Navigate to the sign in screen
              },
              child: const Text(StringManager.skip),
            )
          ],
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        body: Column(
          children: <Expanded>[
            Expanded(
              flex: 5,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: _onBoardingPageController,
                itemCount: onBoardingScreenObject.numberOfOnBoardingItems,
                onPageChanged: _viewModel.onPageChanged,
                itemBuilder: (_, int position)  {
                  OnBoardingDataModel onBoardingDataModel = onBoardingScreenObject.onBoardingDataObjectList[position];
                  return OnBoardingItem(onBoardingDataModel: onBoardingDataModel);
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SmoothPageIndicator(
                      controller: _onBoardingPageController,
                      count: onBoardingScreenObject.numberOfOnBoardingItems,
                      effect: ExpandingDotsEffect(
                        activeDotColor: Theme.of(context).primaryColor,
                        dotHeight: AppSize.s10,
                        dotWidth: AppSize.s10,
                      ),
                    ),
                    SizedBox(
                      width: AppSize.s120,
                      height: AppSize.s40,
                      child: ElevatedButton(
                        onPressed: () {
                          if(onBoardingScreenObject.currentOnBoardingItemIndex < onBoardingScreenObject.numberOfOnBoardingItems - 1) {
                            _onBoardingPageController.nextPage(
                              duration: const Duration(seconds: TimeValue.onBoardingPageChangeDuration),
                              curve: Curves.fastOutSlowIn,
                            );
                          } else {
                            // TODO: navigate to sign in screen (when sign in screen completed)
                          }
                        },
                        child: Text(onBoardingScreenObject.currentOnBoardingItemIndex != onBoardingScreenObject.numberOfOnBoardingItems - 1 ? StringManager.next : StringManager.getStarted),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

}




