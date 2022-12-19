import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextInputType? keyboardType;
  final String? hintText;
  final int? maxLines;
  final String? initialValue;
  final Function(String)? onChanged;

  const CustomTextFormField(
      {super.key,
      this.initialValue,
      this.keyboardType,
      this.hintText,
      this.maxLines = 1,
      this.onChanged});

  static const InputBorder inputBorder = UnderlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(20),
    ),
    borderSide: BorderSide.none,
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged!,
      initialValue: initialValue,
      maxLines: maxLines,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: inputBorder,
        focusedBorder: inputBorder,
        filled: true,
        fillColor: const Color(0XFFEFEFEF),
        contentPadding: const EdgeInsets.all(15),
      ),
    );
  }
}
