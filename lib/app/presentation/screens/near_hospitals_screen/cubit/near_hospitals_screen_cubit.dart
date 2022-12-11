import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medita_patient/app/presentation/screens/near_hospitals_screen/cubit/near_hospitals_screen_states.dart';
import 'package:medita_patient/app/presentation/widgets/hospital_card_item/hospital_card_item.dart';

import '../../../../data/models/data/failure/auth/auth_failure.dart';
import '../../../../data/models/data/hospital/hospital.dart';
import '../../../../domain/use_cases/hospital/list_near_hospitals.dart';

class NearHospitalsScreenCubit extends Cubit<NearHospitalsScreenState> {
  final ListNearHospitalsUseCase _listNearHospitalsUseCase;
  List<Hospital> hospitals = [];
  bool isLoading = false;

  NearHospitalsScreenCubit(this._listNearHospitalsUseCase) : super(NearHospitalsScreenInitState());

  /// this get method return the [BlocProvider] of the [NearHospitalsScreenCubit]
  /// by passing the [BuildContext] called [context]
  static NearHospitalsScreenCubit get(BuildContext context) => BlocProvider.of(context);

  /// this init function called when the cubit initialized
  /// to call the listNearHospitals to retrieve the data
  void init() {
    listNearHospitals();
  }

  /// Execute the api call and get the hospitals list
  void listNearHospitals() async {
    isLoading = true;
    emit(NearHospitalsScreenLoadingGetDataProcessState());
    Either<Failure, List<Hospital>> response = await _listNearHospitalsUseCase.execute();
    response.fold((failure) {
      if (kDebugMode) {
        print("===> Fail ${failure.message}");
      }
    }, (hospitalsList) {
      hospitals = hospitalsList;
    });
    isLoading = false;
    emit(NearHospitalsScreenSuccessGetDataProcessState());
  }

  /// This function build the HospitalCardItem and return it
  /// by passing the [position] of the item
  /// and return the [HospitalCardItem] widget
  HospitalCardItem hospitalCardItemBuilder(_, int position) {
    Hospital hospital = hospitals[position];
    return HospitalCardItem(hospital: hospital);
  }
}
