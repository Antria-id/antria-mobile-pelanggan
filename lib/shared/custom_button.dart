import 'package:flutter/material.dart';
import '../../../config/themes/themes.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final VoidCallback onPressed;
  final EdgeInsets margin;
  final double radius;
  final double sizeFont;
  const CustomButton({
    super.key,
    required this.title,
    this.width = double.infinity,
    this.height = 55,
    required this.onPressed,
    this.margin = EdgeInsets.zero,
    this.radius = 18,
    this.sizeFont = 18,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
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
            fontSize: sizeFont,
            fontWeight: medium,
          ),
        ),
      ),
    );
  }
}
