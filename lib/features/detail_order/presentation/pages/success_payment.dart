import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/features/history/presentation/bloc/detail/detail_bloc.dart';
import 'package:antria_mobile_pelanggan/features/history/presentation/widgets/done_order/detail_payment_recipt.dart';
import 'package:antria_mobile_pelanggan/features/history/presentation/widgets/done_order/list_order_recipt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class SuccessPayment extends StatelessWidget {
  final String invoice;

  const SuccessPayment({super.key, required this.invoice});

  @override
  Widget build(BuildContext context) {
    print('Received invoice: $invoice');

    return BlocProvider(
      create: (context) => DetailTransactionBloc()
        ..add(DetailTransactionFetchData(invoice: invoice)),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          elevation: 0,
          automaticallyImplyLeading: false,
          toolbarHeight: 0,
        ),
        body: SafeArea(
          child: BlocBuilder<DetailTransactionBloc, DetailTransactionState>(
            builder: (context, state) {
              if (state is DetailTransactionError) {
                print('Error State: ${state.message}');
                return Center(
                  child: Text(
                    'Error: ${state.message}',
                    style: blackTextStyle,
                  ),
                );
              } else if (state is DetailTransactionLoaded) {
                final detail = state.response;
                print('DetailTransactionLoaded invoice: $invoice');
                print('Detail data: ${detail.toString()}');

                int totalitemPrice = 0;
                int biayaLayanan = 1000;
                detail.oderlist?.forEach((order) {
                  if (order.produk != null && order.produk!.harga != null) {
                    totalitemPrice += (order.produk!.harga! * order.quantity!);
                  }
                });

                String formatDate(DateTime? date) {
                  if (date == null) return '';
                  final DateFormat formatter = DateFormat('dd-MM-yyyy');
                  return formatter.format(date);
                }

                String formatTime(DateTime? date) {
                  if (date == null) return '';
                  final DateFormat formatter = DateFormat('HH:mm');
                  return formatter.format(date);
                }

                String formattedPrice = NumberFormat.currency(
                  locale: 'id_ID',
                  symbol: 'Rp ',
                  decimalDigits: 0,
                ).format(totalitemPrice);

                int totalBiaya = totalitemPrice + biayaLayanan;
                String formattedTotalBiaya = NumberFormat.currency(
                  locale: 'id_ID',
                  symbol: 'Rp ',
                  decimalDigits: 0,
                ).format(totalBiaya);

                String formattedBiayaLayanan = NumberFormat.currency(
                  locale: 'id_ID',
                  symbol: 'Rp ',
                  decimalDigits: 0,
                ).format(biayaLayanan);

                String getOrderTypeText(bool takeaway) {
                  return takeaway ? 'Takeaway' : 'Dine In';
                }

                return Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                  child: Column(
                    children: [
                      Center(
                        child: Column(
                          children: [
                            Text(
                              'Pembayaran Berhasil',
                              style: blackTextStyle.copyWith(
                                fontSize: 20,
                                fontWeight: bold,
                              ),
                            ),
                            Text(
                              'Hi, ${detail.pelanggan!.nama}',
                              style: blackTextStyle.copyWith(
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text('Detail Pesanan'),
                              Spacer(),
                              Text(
                                getOrderTypeText(detail.takeaway!),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(formatDate(detail.createdAt)),
                              Spacer(),
                              Text(formatTime(detail.createdAt)),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: ListOrderRecipt(
                          orderRecipt: [state.response],
                        ),
                      ),
                      DetailPaymentRecipt(
                        invoice: invoice,
                        totalPrice: totalitemPrice,
                        serviceFee: biayaLayanan,
                        totalPayment: totalBiaya,
                        paymentMethod: detail.payment!,
                      ),
                      const SizedBox(height: 20),
                      Container(
                        margin: const EdgeInsets.only(top: 40),
                        width: 160,
                        height: 40,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/queue-page');
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            'Lihat Antrian',
                            style: whiteTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: medium,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
