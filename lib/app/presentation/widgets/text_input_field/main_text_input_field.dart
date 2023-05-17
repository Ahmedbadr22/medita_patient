import 'package:flutter/material.dart';
import 'package:medita_patient/app/presentation/manager/values_manager.dart';

class MainTextInputField extends StatelessWidget {
  const MainTextInputField({
    Key? key,
    this.prefixIcon,
    this.hint,
    this.suffixIcon,
    this.onChange,
    this.isObscureText,
    this.controller,
    this.errorText,
    this.validator,
    this.textInputType,
    this.expands = false,
    this.maxLines
  }) : super(key: key);

  final TextEditingController? controller;
  final String? errorText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? isObscureText;
  final String? hint;
  final Function(String)? onChange;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final bool expands;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      keyboardType: textInputType,
      decoration: InputDecoration(
        errorText: errorText,
        prefixIcon: SizedBox(
          width: AppSize.s50,
          child: prefixIcon,
        ),
        hintText: hint,
        suffixIcon: suffixIcon,
        prefixIconConstraints: const BoxConstraints(
          maxHeight: 24,
          minWidth: 24,
        ),
      ),
      textAlign: TextAlign.justify,
      maxLines: maxLines,
      expands: expands,
      onChanged: onChange,
      obscureText: isObscureText ?? false,
    );
  }
}
