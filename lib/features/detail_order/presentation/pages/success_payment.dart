import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/features/ewallet/data/models/update_ewallet_model.dart';
import 'package:antria_mobile_pelanggan/features/ewallet/presentation/bloc/ewallet_bloc.dart';
import 'package:antria_mobile_pelanggan/features/history/presentation/bloc/detail/detail_bloc.dart';
import 'package:antria_mobile_pelanggan/features/history/presentation/widgets/done_order/detail_payment_recipt.dart';
import 'package:antria_mobile_pelanggan/features/history/presentation/widgets/done_order/list_order_recipt.dart';
import 'package:antria_mobile_pelanggan/features/profile/presentation/bloc/pelanggan_profile/pelanggan_profile_bloc.dart';
import 'package:antria_mobile_pelanggan/shared/error_fetch_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class SuccessPayment extends StatelessWidget {
  final String invoice;

  const SuccessPayment({super.key, required this.invoice});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailTransactionBloc()
        ..add(DetailTransactionFetchData(invoice: invoice)),
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
            'Resi Anda',
            style: whiteTextStyle.copyWith(fontWeight: bold),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: SafeArea(
          child: BlocBuilder<DetailTransactionBloc, DetailTransactionState>(
            builder: (context, state) {
              if (state is DetailTransactionError) {
                return ErrorFetchData();
              } else if (state is DetailTransactionLoaded) {
                final detail = state.response;

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
                  return formatter.format(date.toLocal());
                }

                int totalBiaya = totalitemPrice + biayaLayanan;

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
                              'Hi, ${detail.pelanggan!.username}',
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
                              const Text('Detail Pesanan'),
                              const Spacer(),
                              Text(
                                getOrderTypeText(detail.takeaway!),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(formatDate(detail.createdAt)),
                              const Spacer(),
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
                      BlocProvider(
                        create: (context) => PelangganProfileBloc()
                          ..add(
                            PelangganProfileFetchData(),
                          ),
                        child: BlocBuilder<PelangganProfileBloc,
                            PelangganProfileState>(
                          builder: (context, state) {
                            if (state is PelangganProfileLoaded) {
                              final userWallet = state.pelangganModel.wallet!;
                              return Container(
                                margin: const EdgeInsets.only(top: 40),
                                width: 160,
                                height: 40,
                                child: TextButton(
                                  onPressed: () {
                                    if (detail.payment == 'EWALLET') {
                                      int newBalance = userWallet - totalBiaya;
                                      context.read<EwalletBloc>().add(
                                            UpdateEwalletTapped(
                                              updateEwallet: UpdateEwalletModel(
                                                wallet: newBalance,
                                              ),
                                            ),
                                          );
                                      Navigator.pushNamed(
                                        context,
                                        '/queue-page',
                                        arguments: {
                                          'mitraId': detail.mitraId,
                                          'invoice': detail.invoice,
                                        },
                                      );
                                    } else if (detail.payment == 'CASH') {
                                      Navigator.pushNamed(
                                        context,
                                        '/queue-page',
                                        arguments: {
                                          'mitraId': detail.mitraId,
                                          'invoice': detail.invoice,
                                        },
                                      );
                                    }
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
                              );
                            }
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          },
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
