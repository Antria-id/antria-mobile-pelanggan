import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/features/history/presentation/widgets/order_progress/list_transactions_progress.dart';
import 'package:flutter/material.dart';

class OrderProgress extends StatelessWidget {
  const OrderProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: backgroundGreyColor,
      body: ListTransactionProgress(),
    );
  }
}
