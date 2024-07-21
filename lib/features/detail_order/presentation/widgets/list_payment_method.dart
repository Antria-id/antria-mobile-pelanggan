import 'package:antria_mobile_pelanggan/features/profile/presentation/bloc/pelanggan_profile/pelanggan_profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'card_payment.dart';

class ListPaymentMethod extends StatefulWidget {
  final ValueChanged<String> onPaymentMethodChanged;
  final int totalPrice;
  const ListPaymentMethod({
    super.key,
    required this.onPaymentMethodChanged,
    required this.totalPrice,
  });

  @override
  ListPaymentMethodState createState() => ListPaymentMethodState();
}

class ListPaymentMethodState extends State<ListPaymentMethod> {
  List<Map<String, dynamic>> paymentList = [
    {'label': 'CASH', 'icon': 'assets/icons/cash.png'},
    {'label': 'EWALLET', 'icon': 'assets/icons/ewallet.png', 'wallet': 0},
  ];

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PelangganProfileBloc()..add(PelangganProfileFetchData()),
      child: BlocBuilder<PelangganProfileBloc, PelangganProfileState>(
        builder: (context, state) {
          if (state is PelangganProfileLoaded) {
            final walletBalance = state.pelangganModel.wallet;
            paymentList = [
              {'label': 'CASH', 'icon': 'assets/icons/cash.png'},
              {
                'label': 'EWALLET',
                'icon': 'assets/icons/ewallet.png',
                'wallet': walletBalance
              },
            ];
          }

          return ListView.separated(
            itemBuilder: (context, index) {
              final payment = paymentList[index];
              return GestureDetector(
                onTap: () {
                  if (payment['label'] == 'EWALLET' &&
                      payment['wallet'] < widget.totalPrice) {
                    return;
                  }
                  setState(() {
                    selectedIndex = index;
                  });
                  widget.onPaymentMethodChanged(payment['label']);
                },
                child: CardPayment(
                  label: payment['label'],
                  icon: payment['icon'],
                  selectedIndex: selectedIndex,
                  index: index,
                  wallet: payment['wallet'] as int?,
                  totalPrice:
                      widget.totalPrice, // Pass totalPrice to CardPayment
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 20,
              );
            },
            itemCount: paymentList.length,
          );
        },
      ),
    );
  }
}
