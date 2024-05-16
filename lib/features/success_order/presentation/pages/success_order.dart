import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:flutter/material.dart';
import '../../../../shared/custom_button.dart';

class SuccessOrderPage extends StatelessWidget {
  const SuccessOrderPage({super.key});

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
              'assets/icons/success.png',
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              'Pesanan kamu sudah berhasil !',
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'Silahkan periksa kembali detail\npesananmu di riwayat',
              style: greyTextStyle.copyWith(
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
            CustomButton(
              title: 'Kasih Rating',
              onPressed: () {
                Navigator.pushNamed(context, '/rating-page');
              },
              width: 354,
              radius: 40,
              margin: EdgeInsets.only(
                top: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
