import 'package:antria_mobile_pelanggan/features/history/presentation/widgets/order_progress/transaction_card_progress.dart';
import 'package:flutter/material.dart';

class ListTransactionProgress extends StatelessWidget {
  const ListTransactionProgress({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> transaction = [
      {
        'invoice': 'INVCGA1RO2131026032024',
        'tanggal': '18-12-2024',
        'income': 60000,
      },
      {
        'invoice': 'INVCGA1RO2131026032024',
        'tanggal': '18-12-2024',
        'income': 60000,
      },
      {
        'invoice': 'INVCGA1RO2131026032024',
        'tanggal': '18-12-2024',
        'income': 60000,
      },
    ];
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: ListView.separated(
          padding: const EdgeInsets.only(
            bottom: 70,
          ),
          itemCount: transaction.length,
          itemBuilder: (context, index) {
            return TransaksiCardProgress(
              invoice: transaction[index]['invoice'],
              tanggal: transaction[index]['tanggal'],
              income: transaction[index]['income'],
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/queue-page',
                );
              },
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
