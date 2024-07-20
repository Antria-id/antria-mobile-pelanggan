import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'card_payment.dart';

class ListPaymentMethod extends StatefulWidget {
  final ValueChanged<String> onPaymentMethodChanged;
  final int walletBalance;

  const ListPaymentMethod({
    Key? key,
    required this.onPaymentMethodChanged,
    required this.walletBalance,
  }) : super(key: key);

  @override
  ListPaymentMethodState createState() => ListPaymentMethodState();
}

class ListPaymentMethodState extends State<ListPaymentMethod> {
  late List<Map<String, dynamic>> paymentList;
  int selectedIndex = -1;

  @override
  void initState() {
    super.initState();
    String formattedWalletBalance = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    ).format(widget.walletBalance);

    paymentList = [
      {'label': 'CASH', 'icon': 'assets/icons/cash.png'},
      {
        'label': 'EWALLET ($formattedWalletBalance)',
        'icon': 'assets/icons/ewallet.png'
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final payment = paymentList[index];
        return GestureDetector(
          onTap: () {
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
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 20);
      },
      itemCount: paymentList.length,
    );
  }
}
