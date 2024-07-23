import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/features/detail_order/presentation/widgets/list_card_order.dart';
import 'package:antria_mobile_pelanggan/features/detail_order/presentation/widgets/list_payment_method.dart';
import 'package:antria_mobile_pelanggan/features/detail_order/presentation/widgets/list_service.dart';
import 'package:antria_mobile_pelanggan/features/home/presentation/bloc/user/user_bloc.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/presentation/bloc/info_restaurant/info_restaurant_bloc.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/presentation/bloc/menu/menu_bloc.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/presentation/bloc/orderlist/order_list_bloc.dart';
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
  bool isSelected = false;
  bool isSelectedDineIn = false;
  bool isSelectedTakeaway = true;
  String serviceType = 'Take Away';

  void showBottomSheet() {
    int initialSelectedIndex = isSelectedTakeaway ? 0 : 1;

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.44,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  width: 30,
                  height: 4,
                  decoration: BoxDecoration(
                    color: greyColor,
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Text(
                  'Pilih Tipe Pemesanan',
                  style: blackTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListServiceType(
                onPemesananType: (selectedType) {
                  setState(() {
                    isSelectedTakeaway = selectedType['isTakeAway']!;
                    isSelectedDineIn = selectedType['isDineIn']!;

                    serviceType =
                        selectedType['isTakeAway']! ? 'Takeaway' : 'Dine In';
                  });
                },
                initialSelectedIndex: initialSelectedIndex,
                mitraId: widget.mitraId,
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        );
      },
    );
  }

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
                width: 360,
                height: 70,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                  border: Border.all(
                    width: 1,
                    color: whiteColor,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        child: Image.asset(
                          isSelectedTakeaway
                              ? 'assets/icons/takeaway.png'
                              : 'assets/icons/dine-in.png',
                          width: 30,
                          height: 30,
                        ),
                      ),
                      const SizedBox(
                        width: 14,
                      ),
                      Text(
                        serviceType,
                        style: blackTextStyle.copyWith(
                          fontWeight: bold,
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: showBottomSheet,
                        child: Text(
                          'Ubah',
                          style: whiteTextStyle.copyWith(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
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
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: ListPaymentMethod(
                                              totalPrice: totalitemPrice,
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
                            final menuBloc = BlocProvider.of<MenuBloc>(context);
                            menuBloc.add(ClearMenu());
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
