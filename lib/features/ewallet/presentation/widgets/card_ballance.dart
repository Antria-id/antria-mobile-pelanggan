import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/shared/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardBallance extends StatelessWidget {
  final int balance;
  final bool isHome;

  const CardBallance({super.key, required this.balance, required this.isHome});

  @override
  Widget build(BuildContext context) {
    String formattedPrice(int balance) {
      return NumberFormat.currency(
        locale: 'id_ID',
        symbol: 'Rp ',
        decimalDigits: 0,
      ).format(balance);
    }

    return Container(
      height: 90,
      width: 356,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        color: whiteColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Saldo Anda :',
                  style: blackTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                SizedBox(
                  width: 250,
                  child: Text(
                    formattedPrice(balance),
                    style: blackTextStyle.copyWith(
                      fontSize: 24,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            isHome
                ? Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: CustomButton(
                      width: 66,
                      height: 36,
                      title: 'Top up',
                      sizeFont: 12,
                      onPressed: () {
                        Navigator.pushNamed(context, '/ewallet-page');
                      },
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
