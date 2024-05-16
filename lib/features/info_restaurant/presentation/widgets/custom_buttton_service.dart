import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:flutter/material.dart';

class CustomButtonService extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback? onTap;

  const CustomButtonService({
    super.key,
    required this.title,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 34,
        width: 154,
        margin: const EdgeInsets.only(
          right: 24,
        ),
        decoration: BoxDecoration(
          color: isSelected ? primaryColor : whiteColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? whiteColor : primaryColor,
              fontSize: 12,
              fontWeight: semiBold,
            ),
          ),
        ),
      ),
    );
  }
}
