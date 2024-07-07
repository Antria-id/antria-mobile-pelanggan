import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/features/history/presentation/bloc/detail/detail_bloc.dart';
import 'package:antria_mobile_pelanggan/features/history/presentation/widgets/done_order/detail_payment_recipt.dart';
import 'package:antria_mobile_pelanggan/features/history/presentation/widgets/done_order/list_order_recipt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuccessPayment extends StatelessWidget {
  const SuccessPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 0,
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    Text(
                      'Pembayaran Berhasil',
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
                child:
                    BlocBuilder<DetailTransactionBloc, DetailTransactionState>(
                  builder: (context, state) {
                    if (state is DetailTransactionError) {
                      return Center(
                        child: Text(
                          'Error',
                        ),
                      );
                    } else if (state is DetailTransactionLoaded) {
                      return Expanded(
                        child: ListOrderRecipt(
                          orderRecipt: [state.response],
                        ),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              DetailPaymentRecipt(
                invoice: 'dsadsa',
                totalPrice: 60000,
                serviceFee: 12000,
                totalPayment: 72000,
                paymentMethod: 'Cash',
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 40,
                ),
                width: 160,
                height: 40,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/queue-page',
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Lihat Antrian',
                    style: whiteTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
