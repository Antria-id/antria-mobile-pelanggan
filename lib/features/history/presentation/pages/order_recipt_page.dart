import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/features/history/presentation/widgets/done_order/detail_payment_recipt.dart';
import 'package:antria_mobile_pelanggan/features/history/presentation/widgets/done_order/list_order_recipt.dart';
import 'package:flutter/material.dart';

class OrderRecipt extends StatelessWidget {
  const OrderRecipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    Text(
                      'Pesanan Kamu',
                      style: blackTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: bold,
                      ),
                    ),
                    Text(
                      'Hi, Rovino',
                      style: blackTextStyle.copyWith(
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Detail Pesanan',
                      ),
                      Spacer(),
                      Text(
                        'Dine In',
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Sabtu, 01-02-2024',
                      ),
                      Spacer(),
                      Text(
                        '18.00 WIB',
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 180,
                child: Expanded(
                  child: ListOrderRecipt(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              DetailPaymentRecipt(
                totalPrice: 60000,
                serviceFee: 12000,
                totalPayment: 72000,
                paymentMethod: 'Cash',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
