import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:flutter/material.dart';

import '../../../../shared/bottom_navigation.dart';
import '../../../../shared/custom_button.dart';

class ThanksPage extends StatelessWidget {
  const ThanksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/icon_thanks.png',
              width: 210,
              height: 164,
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              'Terima Kasih Atas\nPenilaian Kamu !!!!!',
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            CustomButton(
              title: 'Go back to Home',
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BottomNavigationWidget(),
                  ),
                );
              },
              width: 354,
              radius: 40,
              margin: const EdgeInsets.only(
                top: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
