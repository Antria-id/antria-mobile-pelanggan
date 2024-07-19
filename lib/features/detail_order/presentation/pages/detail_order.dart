import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/features/detail_order/presentation/widgets/list_card_order.dart';
import 'package:antria_mobile_pelanggan/features/detail_order/presentation/widgets/list_payment_method.dart';
import 'package:antria_mobile_pelanggan/features/home/presentation/bloc/user/user_bloc.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/presentation/bloc/info_restaurant/info_restaurant_bloc.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/presentation/bloc/orderlist/order_list_bloc.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/presentation/widgets/custom_buttton_service.dart';
import 'package:antria_mobile_pelanggan/features/profile/presentation/bloc/pelanggan_profile/pelanggan_profile_bloc.dart';
import 'package:antria_mobile_pelanggan/shared/custom_button.dart';
import 'package:antria_mobile_pelanggan/shared/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class DetailOrderPage extends StatefulWidget {
  final int mitraId;
  const DetailOrderPage({super.key, required this.mitraId});

  @override
  State<DetailOrderPage> createState() => _DetailOrderPageState();
}

class _DetailOrderPageState extends State<DetailOrderPage> {
  String paymentMethod = 'Pilih Metode Pembayaran';
  int biayaLayanan = 1000;
  bool isSelectedDineIn = true;
  bool isSelectedTakeaway = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: whiteColor,
          ),
        ),
        title: Text(
          'Detail Pesanan',
          style: whiteTextStyle.copyWith(
            fontWeight: bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: backgroundGreyColor,
      body: BlocProvider(
        create: (context) =>
            OrderListBloc()..add(GetProductsInOrderListEvent()),
        child: SingleChildScrollView(
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
              const SizedBox(
                height: 10,
              ),
              const ListCardOrder(),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 22,
                ),
                child: Row(
                  children: [
                    Flexible(
                      child: CustomButtonService(
                        title: 'Dine In',
                        isSelected: isSelectedDineIn,
                        onTap: () {
                          setState(() {
                            isSelectedDineIn = true;
                            isSelectedTakeaway = false;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 0,
                    ),
                    Flexible(
                      child: CustomButtonService(
                        title: 'Takeaway',
                        isSelected: isSelectedTakeaway,
                        onTap: () {
                          setState(
                            () {
                              isSelectedTakeaway = true;
                              isSelectedDineIn = false;
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
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
                            height: 40,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return FractionallySizedBox(
                                    heightFactor: 0.5,
                                    child: BlocProvider(
                                      create: (context) =>
                                          PelangganProfileBloc()
                                            ..add(PelangganProfileFetchData()),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: BlocBuilder<PelangganProfileBloc,
                                            PelangganProfileState>(
                                          builder: (context, state) {
                                            if (state
                                                is PelangganProfileError) {
                                              return Text('Error');
                                            } else if (state
                                                is PelangganProfileLoaded) {
                                              return Column(
                                                children: [
                                                  Expanded(
                                                    child: ListPaymentMethod(
                                                      walletBalance: state
                                                          .pelangganModel
                                                          .wallet!,
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
                                              );
                                            }
                                            return Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              minimumSize: const Size(337, 67),
                              backgroundColor: primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Row(
                              children: [
                                Transform.rotate(
                                  angle: 90 * 3.1415926535 / 180,
                                  child: const Icon(
                                    Icons.arrow_forward_ios_sharp,
                                    size: 24,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
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
                                const Spacer(),
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
      ),
      bottomNavigationBar: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => UserBloc()..add(const UserFetchDataEvent()),
          ),
          BlocProvider(
            create: (context) => InfoRestaurantBloc()
              ..add(InfoRestaurantUserEvent(mitraId: widget.mitraId)),
          ),
        ],
        child: BlocListener<OrderListBloc, OrderListState>(
          listener: (context, state) {
            if (state is AddPesanan) {
              Navigator.pushNamed(
                context,
                '/success-payment',
                arguments: state.invoice,
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: BlocBuilder<InfoRestaurantBloc, InfoRestaurantState>(
              builder: (context, state) {
                if (state is InfoRestaurantLoadedState) {
                  final namaToko =
                      state.response.namaToko!.substring(0, 2).toUpperCase();
                  return BlocBuilder<UserBloc, UserState>(
                    builder: (context, state) {
                      if (state is UserLoadedState) {
                        final id = state.user.sub;
                        final name =
                            state.user.username!.substring(0, 2).toUpperCase();
                        return TextButton(
                          onPressed: () {
                            if (paymentMethod == 'Pilih Metode Pembayaran') {
                              showToastFailedMessage('Pilih Metode Pembayaran');
                              return;
                            }
                            int timestamp =
                                DateTime.now().millisecondsSinceEpoch ~/ 1000;
                            String invoice =
                                'INVC$namaToko${widget.mitraId}$name$id$timestamp';
                            print('Generated invoice: $invoice');

                            context.read<OrderListBloc>().add(
                                  AddPesananEvent(
                                    invoice: invoice,
                                    payment: paymentMethod,
                                    pelangganId: id!,
                                    pemesanan: 'ONLINE',
                                    takeaway: isSelectedTakeaway,
                                    mitraId: widget.mitraId,
                                  ),
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
                        );
                      }
                      return const Center(child: CircularProgressIndicator());
                    },
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ),
      ),
    );
  }
}
