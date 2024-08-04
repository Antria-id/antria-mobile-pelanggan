import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Center(
        child: Container(
          color: Colors.transparent,
          child: const CircularProgressIndicator(
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
