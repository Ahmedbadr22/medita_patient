import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medita_patient/app/app/extensions.dart';
import 'package:medita_patient/app/presentation/manager/asset_manager.dart';
import 'package:medita_patient/app/presentation/manager/values_manager.dart';
import 'package:medita_patient/app/presentation/screens/schedule/screens/disease_test_screen/cubit/disease_test_cubit.dart';
import 'package:medita_patient/app/presentation/screens/schedule/screens/disease_test_screen/cubit/disease_test_state.dart';
import 'package:medita_patient/app/presentation/screens/schedule/screens/disease_test_screen/model/disease_category.dart';

class DiseaseTestScreen extends StatelessWidget {
  const DiseaseTestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DiseaseTestCubit cubit = DiseaseTestCubit.get(context);

    void onSelectImage() async {
      try {
        XFile? image =
            await ImagePicker().pickImage(source: ImageSource.gallery);

        if (image == null) {
          return;
        }

        File imageFile = File(image.path);
        cubit.onChangeSelectedDiseaseImage(imageFile);
      } catch (error) {
        if (kDebugMode) {
          print(error.toString());
        }
      }
    }

    DropdownMenuItem dropdownMenuItemBuilder(DiseaseCategory category) {
      return DropdownMenuItem(
        value: category.type,
        child: Text(category.title),
      );
    }

    return BlocBuilder<DiseaseTestCubit, DiseaseTestState>(
      builder: (BuildContext context, DiseaseTestState state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Ai Test"),
          ),
          body: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p16),
              child: Column(
                children: <Expanded>[
                  Expanded(
                    flex: 4,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 3,
                        ),
                      ),
                      child: InkWell(
                        onTap: onSelectImage,
                        child: cubit.selectedDiseaseImage == null
                            ? Image.asset(
                                ImageAsset.placeholderImage,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              )
                            : Image.file(
                                cubit.selectedDiseaseImage!,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                          "${state.prediction?.label ?? ""} - ${state.prediction?.accuracy.toStringAsFixed(2) ?? ""}%"),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          width: double.infinity,
                          child: DropdownButton(
                            value: cubit.selectedDiseaseType,
                            items: cubit.diseaseCategories
                                .map(dropdownMenuItemBuilder)
                                .toList(),
                            onChanged: cubit.onChangeSelectedDiseaseType,
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Visibility(
                        visible: state is LoadingState && state.loading,
                        replacement: SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: cubit.selectedDiseaseImage == null
                                ? null
                                : cubit.onSubmitTest,
                            child: const Text("Submit Test"),
                          ),
                        ),
                        child: const CircularProgressIndicator(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
