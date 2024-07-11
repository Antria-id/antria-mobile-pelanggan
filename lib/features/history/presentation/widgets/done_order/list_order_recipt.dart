import 'package:antria_mobile_pelanggan/features/history/data/models/done_order/detail_transaction_model.dart';
import 'package:antria_mobile_pelanggan/features/history/presentation/widgets/done_order/detail_order_recipt.dart';
import 'package:flutter/material.dart';

class ListOrderRecipt extends StatelessWidget {
  final List<DetailTransactionModel> orderRecipt;
  const ListOrderRecipt({
    super.key,
    required this.orderRecipt,
  });

  @override
  Widget build(BuildContext context) {
    final allOrders =
        orderRecipt.expand((invoice) => invoice.oderlist!).toList();
    return ListView.separated(
      padding: const EdgeInsets.only(
        bottom: 20,
      ),
      itemCount: allOrders.length,
      itemBuilder: (context, index) {
        final order = allOrders[index];
        return DetailOrderRecipt(
          name: order.produk!.namaProduk!,
          desc: order.produk!.deskripsiProduk!,
          price: order.produk!.harga!,
          quantity: order.quantity!,
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
