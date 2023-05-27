import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medita_patient/app/data/models/data/doctor/doctor.dart';
import 'package:medita_patient/app/presentation/manager/string_manager.dart';
import 'package:medita_patient/app/presentation/screens/book_appointment/cubit/book_appointment_state.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../manager/routes_manager.dart';
import '../../../manager/values_manager.dart';
import '../../../widgets/loading/loading_dialog.dart';
import '../cubit/book_appointment_cubit.dart';

class BookAppointmentScreen extends StatelessWidget {
  const BookAppointmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Doctor doctor = ModalRoute.of(context)?.settings.arguments as Doctor;

    BookAppointmentCubit cubit = BookAppointmentCubit.get(context);

    cubit.setAppointmentDoctor(doctor);

    Widget pageViewBuilder(_, int index) => cubit.pages[index];

    return BlocConsumer<BookAppointmentCubit, BookAppointmentState>(
      listener: (context, state) {
        if(state is BookAppointmentLoadingState) {
          if (state.loading) {
            showDialog(context: context, builder: (_) => const LoadingDialog());
          } else {
            Navigator.pop(context);
            Navigator.pop(context);
          }
        }
      },
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
              padding: const EdgeInsets.symmetric(horizontal: AppSize.s16, vertical: AppSize.s8),
              child: SizedBox(
                height: AppSize.s50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: cubit.onNextClick,
                  child: Text(cubit.currentPageIndex == 0 ? StringManager.next : StringManager.done),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
