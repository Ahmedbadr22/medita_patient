import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medita_patient/api/cubits/card_cubit/card_data_state.dart';
import 'package:medita_patient/api/cubits/card_cubit/card_data_cubit.dart';
import 'package:medita_patient/api/cubits/hospital_cubit/hospital_cubit.dart';
import 'package:medita_patient/api/cubits/hospital_cubit/hospital_state.dart';
import 'package:medita_patient/api/cubits/specialty_cubit/specialty_cubit.dart';
import 'package:medita_patient/api/cubits/specialty_cubit/specialty_state.dart';
import 'package:medita_patient/api/hospital_card.dart';
import 'package:medita_patient/api/models/card_data_model.dart';
import 'package:medita_patient/api/repository/card_data_repository.dart';
import 'package:medita_patient/app/presentation/manager/string_manager.dart';
import 'package:medita_patient/app/presentation/manager/values_manager.dart';
import 'package:medita_patient/app/presentation/widgets/fake_search_button/fake_search_button.dart';
import 'package:medita_patient/app/presentation/widgets/home_card/home_card.dart';
import 'package:medita_patient/app/presentation/widgets/hospital_card_item/hospital_card_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../api/models/speciality_model.dart';
import '../../../manager/color_manager.dart';
import '../../../widgets/main_app_bar/main_app_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CardDataCubit>().getCardData();
    context.read<SpecialtyCubit>().getSpecialty();
    context.read<HospitalDataCubit>().getHospitalData();
  }

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
            BlocBuilder<CardDataCubit, CardDataState>(
                builder: ((context, state) {
              if (state is CardDataLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is CardDataSuccess) {
                final listOfCards = state.listOfCards;
                return CardData(
                    pageController: pageController, listOfCards: listOfCards!);
              }
              if (state is CardDataFailure) {
                return const Text('No Internet Connection!');
              }
              return const Text('Try Again Later!');
            })),
            titleSection('Specialty'),
            BlocBuilder<SpecialtyCubit, SpecialtyState>(
                builder: ((context, state) {
              if (state is SpecialtyLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is SpecialtySuccess) {
                final listOfSpeciality = state.listOfSpeciality;
                return SpecialtySecion(doctorSpeciality: listOfSpeciality!);
              }
              if (state is SpecialtyFailure) {
                return const Text('No Internet Connection!');
              }
              return const Text('Try Again Later!');
            })),
            titleSection('Top Hospitals'),
            BlocBuilder<HospitalDataCubit, HospitalDataState>(
                builder: ((context, state) {
              if (state is HospitalLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is HospitalSuccess) {
                final listOfHospitals = state.listOfHospitals;
                return HospitalItem(listOfHospitals: listOfHospitals!);
              }
              if (state is SpecialtyFailure) {
                return const Text('No Internet Connection!');
              }
              return const Text('Try Again Later!');
            })),
          ],
        ),
      ),
    );
  }

  titleSection(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.s8),
      child: ListTile(
        onTap: (() {}),
        title: Text(title,
            softWrap: true,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.bold)),
        trailing: Text(
          StringManager.seeAll,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: ColorManager.lightBlue,
              fontSize: AppSize.s16,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class SpecialtySecion extends StatelessWidget {
  final List<SpecialityModel> doctorSpeciality;
  const SpecialtySecion({Key? key, required this.doctorSpeciality})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: AppSize.s50,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: doctorSpeciality.length,
            itemBuilder: (_, int index) {
              var name = doctorSpeciality[index];
              return Padding(
                padding: const EdgeInsets.only(
                    left: AppSize.s10, bottom: AppSize.s12),
                child: FilterChip(
                  label: Text(
                    name.name,
                    style: TextStyle(
                        color:
                            index == 0 ? Colors.white : ColorManager.lightBlue),
                  ),
                  onSelected: (bool value) {},
                  backgroundColor: index == 0
                      ? Theme.of(context).primaryColor
                      : Colors.transparent,
                  shape: StadiumBorder(
                      side: BorderSide(
                          color: Theme.of(context).primaryColor, width: 1.5)),
                ),
              );
            },
            separatorBuilder: (_, __) {
              return const SizedBox(
                width: AppSize.s10,
              );
            }));
  }
}

class CardData extends StatelessWidget {
  const CardData({
    Key? key,
    required this.pageController,
    required this.listOfCards,
  }) : super(key: key);

  final PageController pageController;
  final List<CardDataModel> listOfCards;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          height: AppSize.s200,
          child: PageView.builder(
            physics: const BouncingScrollPhysics(),
            controller: pageController,
            itemCount: listOfCards.length,
            itemBuilder: (BuildContext context, int index) {
              return HomeCard(
                image: listOfCards[index].image,
                body: listOfCards[index].body,
                title: listOfCards[index].title,
              );
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
    );
  }
}
