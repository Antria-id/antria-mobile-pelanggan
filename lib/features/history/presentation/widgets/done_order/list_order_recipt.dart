import 'package:antria_mobile_pelanggan/features/history/presentation/widgets/done_order/detail_order_recipt.dart';
import 'package:flutter/material.dart';

class ListOrderRecipt extends StatelessWidget {
  const ListOrderRecipt({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> orderRecipt = [
      {
        'name': 'Mie Gacoan',
        'desc': 'Level 0-5',
        'price': 10000,
        'quantity': 3
      },
      {
        'name': 'Mie Gacoan',
        'desc': 'Level 0-5',
        'price': 10000,
        'quantity': 3
      },
      {
        'name': 'Mie Gacoan',
        'desc': 'Level 0-5',
        'price': 10000,
        'quantity': 3
      },
    ];
    return ListView.separated(
      padding: const EdgeInsets.only(
        bottom: 70,
      ),
      itemCount: orderRecipt.length,
      itemBuilder: (context, index) {
        return DetailOrderRecipt(
          name: orderRecipt[index]['name'],
          desc: orderRecipt[index]['desc'],
          price: orderRecipt[index]['price'],
          quantity: orderRecipt[index]['quantity'],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 20,
        );
      },
    );
  }
}
