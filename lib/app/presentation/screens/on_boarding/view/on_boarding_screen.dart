import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medita_patient/app/presentation/manager/asset_manager.dart';
import 'package:medita_patient/app/presentation/manager/string_manager.dart';
import 'package:medita_patient/app/presentation/manager/values_manager.dart';
import 'package:medita_patient/app/presentation/screens/on_boarding/cubit/on_boarding_screen_cubit.dart';
import 'package:medita_patient/app/presentation/screens/on_boarding/cubit/on_boarding_screen_states.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../data/models/on_boarding_data_model.dart';
import '../../../widgets/on_boarding_item/on_boarding_item.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  final PageController _onBoardingPageController = PageController();

  @override
  Widget build(BuildContext context) {
    OnBoardingScreenCubit onBoardingScreenCubit =
        OnBoardingScreenCubit.get(context);

    return BlocConsumer<OnBoardingScreenCubit, OnBoardingScreenState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: SvgPicture.asset(
              ImageAsset.blackLogoImagePath,
              height: AppSize.s50,
            ),
            centerTitle: false,
            actions: <TextButton>[
              TextButton(
                onPressed: () => onBoardingScreenCubit.navigateToAuthenticationScreen(context),
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
                  itemCount:
                      onBoardingScreenCubit.onBoardingModelItemListCount(),
                  onPageChanged:
                      onBoardingScreenCubit.onOnBoardingPageItemChanged,
                  itemBuilder: (_, int position) {
                    OnBoardingPageItemData onBoardingDataModel = onBoardingScreenCubit.onBoardingPageItemDataList[position];
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
                        count: onBoardingScreenCubit
                            .onBoardingModelItemListCount(),
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
                            if (onBoardingScreenCubit.currentOnBoardingPageIndex < onBoardingScreenCubit.onBoardingModelItemListCount() - 1) {
                              _onBoardingPageController.nextPage(
                                duration: const Duration(
                                    seconds: TimeValue.onBoardingPageChangeDuration,
                                ),
                                curve: Curves.fastOutSlowIn,
                              );
                            } else {
                              onBoardingScreenCubit.navigateToAuthenticationScreen(context);
                            }
                          },
                          child: Text(onBoardingScreenCubit.currentOnBoardingPageIndex != onBoardingScreenCubit.onBoardingModelItemListCount() - 1 ? StringManager.next : StringManager.getStarted),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
