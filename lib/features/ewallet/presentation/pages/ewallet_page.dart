import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/features/ewallet/presentation/widgets/card_ballance.dart';
import 'package:antria_mobile_pelanggan/features/ewallet/presentation/widgets/list_nominal.dart';
import 'package:antria_mobile_pelanggan/shared/custom_appbar.dart';
import 'package:antria_mobile_pelanggan/shared/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EwalletPage extends StatefulWidget {
  const EwalletPage({super.key});

  @override
  _EwalletPageState createState() => _EwalletPageState();
}

class _EwalletPageState extends State<EwalletPage> {
  int nominal = 0;

  void _updateSelectedNominal(int newNominal) {
    setState(() {
      nominal = newNominal;
    });
  }

  @override
  Widget build(BuildContext context) {
    String formattedNominal = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    ).format(nominal);

    return Scaffold(
      appBar: CustomAppBarWidget(
        title: 'E-Wallet',
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
      backgroundColor: backgroundGreyColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  const CardBallance(),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Top Up Saldo Anda',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListNominal(
                    onNominalSelected: _updateSelectedNominal,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              child: Text(
                'Nominal',
                style: blackTextStyle.copyWith(
                  fontSize: 14,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: Text(
                formattedNominal,
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: CustomButton(
                width: 320,
                radius: 8,
                title: 'Top Up',
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
