import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medita_patient/app/app/extensions.dart';
import 'package:medita_patient/app/data/models/data/banner/banner.dart';
import 'package:medita_patient/app/data/models/data/hospital/hospital.dart';
import 'package:medita_patient/app/presentation/manager/values_manager.dart';
import 'package:medita_patient/app/presentation/screens/home/view_model/home_screen_cubit.dart';
import 'package:medita_patient/app/presentation/screens/home/view_model/home_screen_states.dart';
import 'package:medita_patient/app/presentation/widgets/fake_search_button/fake_search_button.dart';
import 'package:medita_patient/app/presentation/widgets/home_card/home_card.dart';
import 'package:medita_patient/app/presentation/widgets/hospital_card_item/hospital_card_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../common/builders/builders.dart';
import '../../../manager/color_manager.dart';
import '../../../manager/routes_manager.dart';
import '../../../widgets/main_app_bar/main_app_bar.dart';
import '../../../widgets/section_header/section_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    HomeScreenCubit homeScreenCubit = HomeScreenCubit.get(context);
    var size = MediaQuery.of(context).size;

    homeCardItemBuilder(BuildContext context, int index) {
      MedicalBanner banner = homeScreenCubit.banners[index];
      return HomeCard(banner: banner);
    }

    hospitalCardItemBuilder(BuildContext context, int index) {
      Hospital hospital = homeScreenCubit.hospitals[index];
      return HospitalCardItem(hospital: hospital, size: size,);
    }

    separatorItemBuilder(BuildContext context, int index) {
      return 10.pw;
    }

    return BlocConsumer<HomeScreenCubit, HomeScreenState>(
      listener: (listener, state) {},
      builder: (_, __) {
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
                        itemCount: homeScreenCubit.banners.length,
                        itemBuilder: homeCardItemBuilder,
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: AppSize.s16),
                        child: SmoothPageIndicator(
                          controller: pageController,
                          count: homeScreenCubit.banners.length,
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Column(
                    children: <Widget>[
                      SectionHeader(
                        title: 'Specialities',
                        buttonText: 'Show All',
                        onClick: () {
                          Navigator.pushNamed(context, Routes.specialitiesRoute,
                              arguments: homeScreenCubit.specialities);
                        },
                      ),
                      5.ph,
                      SizedBox(
                        height: homeScreenCubit.getSpecialitiesGridHeight(),
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: 4.0,
                          ),
                          itemCount: homeScreenCubit.specialities.length,
                          itemBuilder: (_, int index) => specialtyItemBuilder(
                            index,
                            homeScreenCubit.specialities,
                          ),
                        ),
                      ),
                      SectionHeader(
                        title: 'Near Hospitals',
                        buttonText: 'Show All',
                        onClick: () {
                          Navigator.pushNamed(context, Routes.nearHospitals);
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 150,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: hospitalCardItemBuilder,
                    separatorBuilder: separatorItemBuilder,
                    itemCount: homeScreenCubit.hospitals.length,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
