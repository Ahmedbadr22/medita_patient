import 'package:flutter/material.dart';
import 'package:medita_patient/app/presentation/manager/values_manager.dart';

class MainTextInputField extends StatelessWidget {
  const MainTextInputField(
      {Key? key,
      this.prefixIcon,
      this.hint,
      this.suffixIcon,
      this.onChange,
      this.isObscureText})
      : super(key: key);

  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? isObscureText;
  final String? hint;
  final Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
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
      onChanged: onChange,
      obscureText: isObscureText ?? false,
    );
  }
}
