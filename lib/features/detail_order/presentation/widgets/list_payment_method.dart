import 'package:flutter/material.dart';

import 'card_payment.dart';

class ListPaymentMethod extends StatefulWidget {
  final ValueChanged<String> onPaymentMethodChanged;
  const ListPaymentMethod({Key? key, required this.onPaymentMethodChanged})
      : super(key: key);

  @override
  ListPaymentMethodState createState() => ListPaymentMethodState();
}

class ListPaymentMethodState extends State<ListPaymentMethod> {
  final List<Map<String, dynamic>> paymentList = [
    {'label': 'CASH', 'icon': 'assets/icons/cash.png'},
    {'label': 'EWALLET', 'icon': 'assets/icons/ewallet.png'},
  ];

  int selectedIndex = -1;

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
        return const SizedBox(
          height: 20,
        );
      },
      itemCount: paymentList.length,
    );
  }
}
