import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/features/detail_order/presentation/widgets/list_card_order.dart';
import 'package:antria_mobile_pelanggan/features/detail_order/presentation/widgets/list_payment_method.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/presentation/bloc/orderlist/order_list_bloc.dart';
import 'package:antria_mobile_pelanggan/shared/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class DetailOrderPage extends StatefulWidget {
  const DetailOrderPage({super.key});

  @override
  State<DetailOrderPage> createState() => _DetailOrderPageState();
}

class _DetailOrderPageState extends State<DetailOrderPage> {
  String paymentMethod = 'Pilih Metode Pembayaran';
  int biayaLayanan = 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
      ),
      backgroundColor: backgroundGreyColor,
      body: BlocProvider(
        create: (context) =>
            OrderListBloc()..add(GetProductsInOrderListEvent()),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'Menu Terpilih',
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: bold,
                ),
              ),
            ),
            const ListCardOrder(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 30,
              ),
              child: BlocConsumer<OrderListBloc, OrderListState>(
                builder: (context, state) {
                  if (state is OrderListLoading) {
                    return Container();
                  } else if (state is OrderListLoaded) {
                    final products = state.products;
                    int totalitemPrice = 0;

                    for (var product in products) {
                      int quantity = product['quantity'] ?? 0;
                      int harga = product['harga'] ?? 0;

                      totalitemPrice += quantity * harga;
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

                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Harga Item',
                              style: blackTextStyle.copyWith(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              formattedPrice,
                              style: blackTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: semiBold,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Biaya Layanan',
                              style: blackTextStyle.copyWith(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              formattedBiayaLayanan,
                              style: blackTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: semiBold,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Divider(
                          thickness: 0.5,
                          color: greyColor,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Harga total',
                              style: blackTextStyle.copyWith(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              formattedTotalBiaya,
                              style: blackTextStyle.copyWith(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return FractionallySizedBox(
                                  heightFactor: 0.5,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: ListPaymentMethod(
                                            onPaymentMethodChanged:
                                                (String value) {
                                              setState(() {
                                                paymentMethod = value;
                                              });
                                            },
                                          ),
                                        ),
                                        CustomButton(
                                          title: 'Pilih',
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            minimumSize: const Size(337, 67),
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Metode Payment',
                                    style: whiteTextStyle.copyWith(
                                      fontWeight: bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    paymentMethod,
                                    style: whiteTextStyle,
                                  ),
                                ],
                              ),
                              Text(
                                formattedTotalBiaya,
                                style: whiteTextStyle.copyWith(
                                  fontWeight: bold,
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    );
                  }
                  return Container();
                },
                listener: (BuildContext context, OrderListState state) {
                  if (state is DecrementQuantity ||
                      state is IncrementQuantity) {
                    BlocProvider.of<OrderListBloc>(context)
                        .add(GetProductsInOrderListEvent());
                  }
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/queue-page',
            );
          },
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Bayar',
            style: whiteTextStyle.copyWith(
              fontSize: 12,
              fontWeight: medium,
            ),
          ),
        ),
      ),
    );
  }
}
