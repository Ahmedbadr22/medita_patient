import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medita_patient/app/data/models/data/doctor/doctor.dart';
import 'package:medita_patient/app/presentation/screens/book_appointment/cubit/book_appointment_state.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../manager/values_manager.dart';
import '../cubit/book_appointment_cubit.dart';

class BookAppointmentScreen extends StatelessWidget {
  const BookAppointmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Doctor doctor = ModalRoute.of(context)?.settings.arguments as Doctor;
    print("Doctor Email is =====>  ${doctor.user.email} and id ${doctor.id}");

    BookAppointmentCubit cubit = BookAppointmentCubit.get(context);

    cubit.setAppointmentDoctor(doctor);

    Widget pageViewBuilder(_, int index) => cubit.pages[index];

    return BlocBuilder<BookAppointmentCubit, BookAppointmentState>(
      builder: (BuildContext context, BookAppointmentState state) {
        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar(
            title: SmoothPageIndicator(
              controller: cubit.pageController,
              count: cubit.pages.length,
              effect: ExpandingDotsEffect(
                activeDotColor: Theme.of(context).primaryColor,
                dotHeight: AppSize.s10,
                dotWidth: AppSize.s10,
              ),
            ),
            centerTitle: true,
          ),
          body: PageView.builder(
            physics: const BouncingScrollPhysics(),
            itemBuilder: pageViewBuilder,
            itemCount: cubit.pages.length,
            onPageChanged: cubit.changeCurrentPageItemIndex,
            controller: cubit.pageController,
          ),
          bottomSheet: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: cubit.onNextClick,
                  child: Text(cubit.currentPageIndex == 0 ? "Next" : "Done"),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
