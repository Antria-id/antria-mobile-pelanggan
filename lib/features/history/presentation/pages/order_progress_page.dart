import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/features/history/presentation/bloc/order_progress/order_bloc.dart';
import 'package:antria_mobile_pelanggan/features/history/presentation/widgets/order_progress/list_transactions_progress.dart';
import 'package:antria_mobile_pelanggan/shared/empty_data.dart';
import 'package:antria_mobile_pelanggan/shared/error_fetch_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderProgress extends StatelessWidget {
  const OrderProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          OrderTransactionBloc()..add(OrderTransactionFetchData()),
      child: Scaffold(
        backgroundColor: backgroundGreyColor,
        body: BlocBuilder<OrderTransactionBloc, OrderTransactionState>(
          builder: (context, state) {
            if (state is OrderTransactionError) {
              return const ErrorFetchData();
            } else if (state is OrderTransactionLoaded) {
              if (state.transactionList.isEmpty) {
                return const EmptyDataWidget();
              } else {
                return ListTransactionProgress(
                    transaksiList: state.transactionList);
              }
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
