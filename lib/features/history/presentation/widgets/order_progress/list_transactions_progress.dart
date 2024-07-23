import 'package:antria_mobile_pelanggan/features/history/data/models/order_progress/order_transaction_response.dart';
import 'package:antria_mobile_pelanggan/features/history/presentation/widgets/order_progress/transaction_card_progress.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListTransactionProgress extends StatelessWidget {
  final List<OrderTransactionResponse> transaksiList;
  const ListTransactionProgress({super.key, required this.transaksiList});

  String formatDate(DateTime? date) {
    if (date == null) return '';
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    return formatter.format(date);
  }

  int income(List<Oderlist> orders) {
    int totalPrice = 0;
    for (var orderItem in orders) {
      totalPrice += (orderItem.quantity! * orderItem.produk!.harga!);
    }
    totalPrice += 1000;
    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    transaksiList.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
    if (transaksiList.isEmpty) {
      return const Center(
        child: Text('Error'),
      );
    }
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: ListView.separated(
          padding: const EdgeInsets.only(
            bottom: 70,
          ),
          itemCount: transaksiList.length,
          itemBuilder: (context, index) {
            final transaksi = transaksiList[index];
            return TransactionCardProgress(
              invoice: transaksi.invoice!,
              tanggal: formatDate(transaksi.createdAt),
              income: income(transaksi.oderlist!),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/success-payment',
                  arguments: transaksi.invoice,
                );
              },
              status: transaksi.antrian!.orderstatus!,
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 20,
            );
          },
        ),
      ),
    );
  }
}
