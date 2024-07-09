import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:flutter/material.dart';

class EmptyDataWidget extends StatelessWidget {
  const EmptyDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/no-data.png',
            width: 251,
            height: 251,
          ),
          const SizedBox(
            height: 33,
          ),
          Text(
            'Data tidak ditemukan',
            style: blackTextStyle.copyWith(
              fontWeight: bold,
            ),
          ),
        ],
      ),
    );
  }
}
