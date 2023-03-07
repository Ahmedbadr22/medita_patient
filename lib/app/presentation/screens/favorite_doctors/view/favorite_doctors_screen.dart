
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medita_patient/app/data/models/data/doctor/favorite_doctor.dart';
import 'package:medita_patient/app/presentation/screens/favorite_doctors/cubit/favorite_doctors_screen_cubit.dart';
import 'package:medita_patient/app/presentation/screens/favorite_doctors/cubit/favorite_doctors_screen_state.dart';
import 'package:medita_patient/app/presentation/widgets/common_app_bar/common_app_bar.dart';
import 'package:medita_patient/app/presentation/widgets/favorite_doctor_card/favorite_doctor_card.dart';

class FavoriteDoctorsScreen extends StatelessWidget {
  const FavoriteDoctorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FavoriteDoctorsScreenCubit cubit = FavoriteDoctorsScreenCubit.get(context);

    FavoriteDoctorCard favoriteDoctorCardItemBuilder(BuildContext context, int index) {
      FavoriteDoctor favoriteDoctor = cubit.favoriteDoctors[index];
      return FavoriteDoctorCard(favoriteDoctor: favoriteDoctor);
    }

    return BlocConsumer<FavoriteDoctorsScreenCubit, FavoriteDoctorsScreenState>(
      listener: (_, __) {},
      builder: (_, __) {
        return Scaffold(
          appBar: commonAppBar(title: "Favorite Doctors"),
          body: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: cubit.favoriteDoctors.length,
              itemBuilder: favoriteDoctorCardItemBuilder,
            ),
          ),
        );
      },
    );
  }
}
