import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/features/history/presentation/bloc/history/history_bloc.dart';
import 'package:antria_mobile_pelanggan/features/history/presentation/widgets/done_order/list_transaction.dart';
import 'package:antria_mobile_pelanggan/shared/empty_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoneOrder extends StatelessWidget {
  const DoneOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HistoryTransactionBloc()..add(HistoryTransactionFetchData()),
      child: Scaffold(
        backgroundColor: backgroundGreyColor,
        body: BlocBuilder<HistoryTransactionBloc, HistoryTransactionState>(
          builder: (context, state) {
            if (state is HistoryTransactionError) {
              return const Center(child: Text('Error'));
            } else if (state is HistoryTransactionLoaded) {
              if (state.transactionList.isEmpty) {
                return const EmptyDataWidget();
              } else {
                return ListTransaction(transaksiList: state.transactionList);
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
