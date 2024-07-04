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

    TextStyle titleStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    );

    TextStyle valueStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Detail Pembayaran',
            style:
                titleStyle.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Column(
            children: [
              Row(
                children: [
                  Text(
                    'Id Pesanan',
                    style: titleStyle,
                  ),
                  const Spacer(),
                  Text(
                    invoice,
                    style: valueStyle,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    'Total Harga',
                    style: titleStyle,
                  ),
                  const Spacer(),
                  Text(
                    formattedTotalPrice,
                    style: valueStyle,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    'Biaya layanan',
                    style: titleStyle,
                  ),
                  const Spacer(),
                  Text(
                    formattedServiceFee,
                    style: valueStyle,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    'Total Pembayaran',
                    style: titleStyle,
                  ),
                  const Spacer(),
                  Text(
                    formattedTotalPayment,
                    style: valueStyle,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    'Metode Pembayaran',
                    style: titleStyle,
                  ),
                  const Spacer(),
                  Text(
                    paymentMethod,
                    style: valueStyle,
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
