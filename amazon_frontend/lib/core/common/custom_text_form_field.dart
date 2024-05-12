import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black38,
          ),
        ),
        hintText: hintText,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black38,
          ),
        ),
      ),
      validator: (String? value) {
        return null;
      },
    );
  }
}
