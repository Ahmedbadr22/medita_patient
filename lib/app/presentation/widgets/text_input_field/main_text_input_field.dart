import 'package:flutter/material.dart';

class MainTextInputField extends StatelessWidget {
  const MainTextInputField({
    Key? key,
    this.prefixIcon,
    this.hint,
    this.suffixIcon,
    this.onChange,
    this.isObscureText
  }) : super(key: key);

  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? isObscureText;
  final String? hint;
  final Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        hintText: hint,
        suffixIcon: suffixIcon,
      ),
      onChanged: onChange,
      obscureText: isObscureText ?? false,
    );
  }
}
