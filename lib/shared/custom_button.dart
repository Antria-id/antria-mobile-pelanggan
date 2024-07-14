import 'package:flutter/material.dart';
import '../../../config/themes/themes.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final double width;
  final VoidCallback onPressed;
  final EdgeInsets margin;
  final double radius;
  const CustomButton(
      {super.key,
      required this.title,
      this.width = double.infinity,
      required this.onPressed,
      this.margin = EdgeInsets.zero,
      this.radius = 18});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 55,
      margin: margin,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              radius,
            ),
          ),
        ),
        child: Text(
          title,
          style: whiteTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
      ),
    );
  }
}
