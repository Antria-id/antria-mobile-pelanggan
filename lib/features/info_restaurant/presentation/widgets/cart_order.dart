import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/presentation/bloc/orderlist/order_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CartOrder extends StatelessWidget {
  const CartOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderListBloc, OrderListState>(
      builder: (context, state) {
        if (state is OrderListLoading) {
          return Container();
        } else if (state is OrderListLoaded) {
          final products = state.products;
          final itemCount = products.length;
          final productNames =
              products.map((product) => product['nama_produk']).join(', ');
          int totalPrice = 0;

          for (var product in products) {
            int quantity = product['quantity'] ?? 0;
            int harga = product['harga'] ?? 0;

            totalPrice += quantity * harga;
          }
          String formattedPrice = NumberFormat.currency(
            locale: 'id_ID',
            symbol: 'Rp ',
            decimalDigits: 0,
          ).format(totalPrice);

          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/detail-order',
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: primaryColor,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/icons/cart.png',
                            width: 30,
                            height: 30,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                '$itemCount Item', // Updated here
                                style: whiteTextStyle.copyWith(
                                  fontWeight: bold,
                                ),
                              ),
                              Text(
                                productNames,
                                style: whiteTextStyle.copyWith(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        formattedPrice,
                        style: whiteTextStyle.copyWith(
                          fontWeight: bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else if (state is ProductAddedToOrderList) {
          BlocProvider.of<OrderListBloc>(context)
              .add(GetProductsInOrderListEvent());
          return Container();
        } else {
          return Container();
        }
      },
    );
  }
}
