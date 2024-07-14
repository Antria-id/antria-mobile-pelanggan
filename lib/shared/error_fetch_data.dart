import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:flutter/material.dart';

class ErrorFetchData extends StatelessWidget {
  const ErrorFetchData({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/error-fetch-data.png',
            width: 251,
            height: 251,
          ),
          const SizedBox(
            height: 33,
          ),
          Text(
            'Pengambilan Data Gagal',
            style: blackTextStyle.copyWith(
              fontWeight: bold,
            ),
          ),
        ],
      ),
    );
  }
}
