import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailPaymentRecipt extends StatelessWidget {
  final String invoice;
  final int totalPrice;
  final int serviceFee;
  final int totalPayment;
  final String paymentMethod;

  const DetailPaymentRecipt({
    super.key,
    required this.totalPrice,
    required this.serviceFee,
    required this.totalPayment,
    required this.paymentMethod,
    required this.invoice,
  });

  @override
  Widget build(BuildContext context) {
    String formattedTotalPrice = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    ).format(totalPrice);
    String formattedServiceFee = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    ).format(serviceFee);
    String formattedTotalPayment = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    ).format(totalPayment);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Detail Pembayaran',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(height: 8),
          Column(
            children: [
              Row(
                children: [
                  Text(
                    'Id Pesanan',
                    style: blackTextStyle.copyWith(fontWeight: semiBold),
                  ),
                  const Spacer(),
                  Text(
                    invoice,
                    style: blackTextStyle,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    'Total Harga',
                    style: blackTextStyle.copyWith(fontWeight: semiBold),
                  ),
                  const Spacer(),
                  Text(
                    formattedTotalPrice,
                    style: blackTextStyle,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    'Biaya layanan',
                    style: blackTextStyle.copyWith(fontWeight: semiBold),
                  ),
                  const Spacer(),
                  Text(
                    formattedServiceFee,
                    style: blackTextStyle,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    'Total Pembayaran',
                    style: blackTextStyle.copyWith(fontWeight: semiBold),
                  ),
                  const Spacer(),
                  Text(
                    formattedTotalPayment,
                    style: blackTextStyle,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    'Metode Pembayaran',
                    style: blackTextStyle.copyWith(fontWeight: semiBold),
                  ),
                  const Spacer(),
                  Text(
                    paymentMethod,
                    style: blackTextStyle,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
