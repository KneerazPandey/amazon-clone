import 'package:amazon_frontend/core/constant/constant.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.secondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        minimumSize: const Size(double.infinity, 55),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
      ),
    );
  }
}
