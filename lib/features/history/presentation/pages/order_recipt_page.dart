import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/features/history/data/models/done_order/detail_transaction_model.dart';
import 'package:antria_mobile_pelanggan/features/history/presentation/bloc/detail/detail_bloc.dart';
import 'package:antria_mobile_pelanggan/features/history/presentation/widgets/done_order/detail_payment_recipt.dart';
import 'package:antria_mobile_pelanggan/features/history/presentation/widgets/done_order/list_order_recipt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class OrderRecipt extends StatelessWidget {
  final String invoice;
  const OrderRecipt({
    super.key,
    required this.invoice,
  });

  String formatDate(DateTime? date) {
    if (date == null) return '';
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    return formatter.format(date);
  }

  String formatOrderList(List<Oderlist> orderList) {
    return orderList
        .map((order) => '${order.produk!.namaProduk} ${order.quantity}x')
        .join(', ');
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailTransactionBloc()
        ..add(
          DetailTransactionFetchData(invoice: invoice),
        ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: whiteColor,
            ),
          ),
          title: Text(
            'Riwayat Pesanan',
            style: whiteTextStyle.copyWith(fontWeight: bold),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: BlocBuilder<DetailTransactionBloc, DetailTransactionState>(
              builder: (context, state) {
                if (state is DetailTransactionError) {
                  return const Center(
                    child: Text('Error'),
                  );
                } else if (state is DetailTransactionLoaded) {
                  var transaksi = state.response;
                  int totalPrice = 0;
                  for (var orderItem in transaksi.oderlist!) {
                    totalPrice +=
                        (orderItem.quantity! * orderItem.produk!.harga!);
                  }
                  String orderList = formatOrderList(transaksi.oderlist!);
                  String formattedPrice = NumberFormat.currency(
                    locale: 'id_ID',
                    symbol: 'Rp ',
                    decimalDigits: 0,
                  ).format(totalPrice);

                  return Column(
                    children: [
                      Center(
                        child: Column(
                          children: [
                            Text(
                              'Pesanan Kamu',
                              style: blackTextStyle.copyWith(
                                fontSize: 20,
                                fontWeight: bold,
                              ),
                            ),
                            Text(
                              'Hi, ${transaksi.pelanggan?.username}',
                              style: blackTextStyle.copyWith(
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Detail Pesanan',
                              ),
                              const Spacer(),
                              Text(
                                transaksi.takeaway! ? 'Takeaway' : 'Dine In',
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                formatDate(transaksi.createdAt),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 180,
                        child: BlocBuilder<DetailTransactionBloc,
                            DetailTransactionState>(
                          builder: (context, state) {
                            if (state is DetailTransactionError) {
                              return const Center(
                                child: Text(
                                  'Error',
                                ),
                              );
                            } else if (state is DetailTransactionLoaded) {
                              return Expanded(
                                child: ListOrderRecipt(
                                  orderRecipt: [state.response],
                                ),
                              );
                            }
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DetailPaymentRecipt(
                        invoice: transaksi.invoice!,
                        totalPrice: totalPrice,
                        serviceFee: 1000,
                        totalPayment: totalPrice + 1000,
                        paymentMethod: transaksi.payment!,
                      ),
                    ],
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
