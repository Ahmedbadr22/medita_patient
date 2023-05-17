import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medita_patient/app/app/extensions.dart';
import 'package:medita_patient/app/presentation/screens/book_appointment/cubit/book_appointment_cubit.dart';
import 'package:medita_patient/app/presentation/screens/book_appointment/cubit/book_appointment_state.dart';

import '../../../manager/string_manager.dart';
import '../../../widgets/text_input_field/main_text_input_field.dart';

class AppointmentProblemDetailScreen extends StatelessWidget {
  const AppointmentProblemDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BookAppointmentCubit cubit = BookAppointmentCubit.get(context);

    return BlocBuilder<BookAppointmentCubit, BookAppointmentState>(
      builder: (BuildContext context, BookAppointmentState state) => Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  "Problem Detail",
                  style: TextStyle(fontSize: 20),
                ),
                10.ph,
                MainTextInputField(
                  controller: cubit.problemDetailController,
                  textInputType: TextInputType.multiline,
                  hint: StringManager.problemDetail,
                  maxLines: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
