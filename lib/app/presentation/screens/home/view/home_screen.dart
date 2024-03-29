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
import 'package:medita_patient/app/presentation/widgets/loading/speciality_loading_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../data/models/data/speciality/speciality.dart';
import '../../../manager/color_manager.dart';
import '../../../manager/routes_manager.dart';
import '../../../widgets/loading/loading_shimmer.dart';
import '../../../widgets/main_app_bar/main_app_bar.dart';
import '../../../widgets/section_header/section_header.dart';
import '../../../widgets/speciality_button/speciality_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    HomeScreenCubit homeScreenCubit = HomeScreenCubit.get(context);
    var size = MediaQuery.of(context).size;

    HomeCard homeCardItemBuilder(BuildContext context, int index) {
      MedicalBanner banner = homeScreenCubit.banners[index];
      return HomeCard(banner: banner);
    }

    HospitalCardItem hospitalCardItemBuilder(BuildContext context, int index) {
      Hospital hospital = homeScreenCubit.hospitals[index];
      return HospitalCardItem(
        hospital: hospital,
        size: size,
      );
    }

    SizedBox separatorItemBuilder(BuildContext context, int index) {
      return 10.pw;
    }

    SpecialityButton specialtyItemBuilder(_, int index) {
      Speciality speciality = homeScreenCubit.specialities[index];
      return SpecialityButton(speciality: speciality);
    }

    SpecialityLoadingButton specialtyShimmerItemBuilder(_, __) {
      return const SpecialityLoadingButton();
    }

    void navigateToShowAllSpecialities() {
      Navigator.pushNamed(context, Routes.specialitiesRoute,
          arguments: homeScreenCubit.specialities);
    }

    void navigateToShowAllNearHospitals() {
      Navigator.pushNamed(context, Routes.nearHospitals);
    }

    return BlocBuilder<HomeScreenCubit, HomeScreenState>(
      builder: (_, HomeScreenState state) {
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
                Visibility(
                  visible: !state.isBannerLoading,
                  replacement: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppPadding.p16),
                    child: LoadingShimmer(
                      height: AppSize.s200,
                      width: double.infinity,
                      borderRadius: AppSize.s16,
                    ),
                  ),
                  child: Stack(
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
                        onClick: navigateToShowAllSpecialities,
                      ),
                      5.ph,
                      Visibility(
                        visible: homeScreenCubit.isSpecialitiesLoaded,
                        replacement: SizedBox(
                          height: 170,
                          child: GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              mainAxisSpacing: 4.0,
                            ),
                            itemCount: 8,
                            itemBuilder: specialtyShimmerItemBuilder,
                          ),
                        ),
                        child: SizedBox(
                          height: AppSize.s170,
                          child: GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              mainAxisSpacing: 4.0,
                            ),
                            itemCount: 8,
                            itemBuilder: specialtyItemBuilder,
                          ),
                        ),
                      ),
                      SectionHeader(
                        title: 'Near Hospitals',
                        buttonText: 'Show All',
                        onClick: navigateToShowAllNearHospitals,
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
