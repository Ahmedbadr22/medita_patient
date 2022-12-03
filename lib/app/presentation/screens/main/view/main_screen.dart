import 'package:flutter/material.dart';
import 'package:medita_patient/app/presentation/manager/values_manager.dart';
import 'package:medita_patient/app/presentation/widgets/fake_search_button/fake_search_button.dart';
import 'package:medita_patient/app/presentation/widgets/home_card/home_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../manager/color_manager.dart';
import '../../../widgets/main_app_bar/main_app_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();

    return Scaffold(
      appBar: mainAppBar(context),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(AppPadding.p16),
              child: FakeSearchButton(),
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  height: AppSize.s200,
                  child: PageView.builder(
                    physics: const BouncingScrollPhysics(),
                    controller: pageController,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return const HomeCard();
                    },
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: SmoothPageIndicator(
                      controller: pageController,
                      count: 3,
                      effect: const ExpandingDotsEffect(
                        dotWidth: 6,
                        dotHeight: 6,
                        activeDotColor: ColorManager.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}


