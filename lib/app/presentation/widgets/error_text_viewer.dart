import 'package:flutter/material.dart';
import 'package:medita_patient/app/presentation/manager/color_manager.dart';

import '../manager/values_manager.dart';

class ErrorTextViewer extends StatelessWidget {
  const ErrorTextViewer({Key? key, required this.isVisible, required this.errorText}) : super(key: key);

  final bool isVisible;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSize.s16),
        child: Text(
          errorText ?? "",
          style: const TextStyle(color: ColorManager.error),
        ),
      ),
    );
  }
}
