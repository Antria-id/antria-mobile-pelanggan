import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:flutter/material.dart';

class StatusCustomerCard extends StatelessWidget {
  const StatusCustomerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/taking-queue-page');
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 16,
              bottom: 26,
            ),
          ),
          Container(
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
                    'assets/icons/icon_queue.png',
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Container(
                  height: 36,
                  width: 182,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Menunggu Antrian',
                      style: purpleTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
