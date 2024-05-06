import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:flutter/material.dart';

import '../widgets/bottom_navigation.dart';

class TakingQueuePage extends StatelessWidget {
  const TakingQueuePage({super.key});

  Widget header() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 46,
          ),
          child: Container(
            width: 352,
            height: 148,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    top: 14,
                  ),
                  child: Image.asset(
                    'assets/images/profile.png',
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Container(
                  height: 36,
                  width: 196,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Pesananmu Sudah Siap',
                      style: purpleTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget customer(BuildContext context) {
    List<Map<String, dynamic>> message = [
      {
        'choose': 'Saya mau ambil sekarang',
        'color': greyColor,
      },
      {
        'choose': 'Saya sedang di perjalanan',
        'color': greyColor,
      },
      {
        'choose': 'Saya datang terlambat',
        'color': greyColor,
      },
      {
        'choose': 'Saya tidak datang',
        'color': redColor,
      },
    ];

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomNavigationWidget(),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(
          top: 48,
        ),
        width: double.infinity,
        height: 380,
        child: ListView.builder(
          itemCount: message.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Container(
                  width: 300,
                  height: 67,
                  decoration: BoxDecoration(
                    color: message[index]['color'],
                    borderRadius: BorderRadius.circular(
                      18,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      message[index]['choose'],
                    ),
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            header(),
            customer(context),
          ],
        ),
      ),
    );
  }
}
