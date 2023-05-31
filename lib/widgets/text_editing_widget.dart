import 'package:flutter/material.dart';

class TextFieldWidgets extends StatelessWidget {
  TextFieldWidgets(
      {super.key,
      required this.controller,
      required this.hintText,
      this.isPasswordField = false,
      this.inputType});

  final TextEditingController controller;
  final String hintText;
  TextInputType? inputType;
  bool? isPasswordField;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffF1F1F1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        keyboardType: inputType ?? TextInputType.text,
        obscureText: isPasswordField ?? false,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            contentPadding: const EdgeInsets.all(20),
            hintStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xffC6C6C6)),
            suffixIcon:
                isPasswordField == true ? const Icon(Icons.visibility) : null),
      ),
    );
  }
}
