import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/presentation/bloc/orderlist/order_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CardMenu extends StatefulWidget {
  final int productId;
  final String image;
  final String productName;
  final String desc;
  final int productPrice;
  final VoidCallback onPressed;
  final int stock;

  const CardMenu({
    super.key,
    required this.image,
    required this.productName,
    required this.productPrice,
    required this.desc,
    required this.onPressed,
    required this.stock,
    required this.productId,
  });

  @override
  State<CardMenu> createState() => _CardMenuState();
}

class _CardMenuState extends State<CardMenu>
    with AutomaticKeepAliveClientMixin {
  int quantity = 1;
  bool isTambah = false;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    String formattedPrice = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    ).format(widget.productPrice);
    super.build(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 90,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.network(
                widget.image,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/images/empty_menu.png',
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 4,
                ),
                Text(
                  widget.productName,
                  style: blackTextStyle.copyWith(
                    fontSize: 14,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  widget.desc,
                  style: greyTextStyle.copyWith(
                    fontSize: 12,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  formattedPrice,
                  style: greyTextStyle.copyWith(
                    fontWeight: bold,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Center(
                  child: isTambah
                      ? Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 32,
                                  height: 32,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    color: greyColor,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      if (quantity > 1) {
                                        setState(() {
                                          quantity--;
                                        });
                                      } else if (quantity == 1) {
                                        setState(() {
                                          isTambah = false;
                                        });
                                      }
                                      final orderList =
                                          BlocProvider.of<OrderListBloc>(
                                        context,
                                      );
                                      orderList.add(
                                        DecrementQuantityEvent(
                                          productId: widget.productId,
                                          quantity: quantity,
                                        ),
                                      );
                                    },
                                    child: const Icon(
                                      Icons.remove,
                                      size: 20,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 58,
                                  height: 32,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                    color: greyColor,
                                  ),
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        '$quantity',
                                        style: blackTextStyle.copyWith(
                                          fontWeight: bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Container(
                                        width: 58,
                                        height: 2,
                                        color: Colors.green,
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    color: greyColor,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (quantity < widget.stock) {
                                          setState(() {
                                            quantity++;
                                            final orderList =
                                                BlocProvider.of<OrderListBloc>(
                                              context,
                                            );
                                            orderList.add(
                                              IncrementQuantityEvent(
                                                productId: widget.productId,
                                                quantity: quantity,
                                              ),
                                            );
                                          });
                                        }
                                      });
                                    },
                                    child: const Icon(
                                      Icons.add,
                                      size: 20,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      : TextButton(
                          onPressed: () {
                            widget.onPressed();
                            setState(() {
                              isTambah = true;
                            });
                            final orderList =
                                BlocProvider.of<OrderListBloc>(context);
                            orderList.add(
                              AddProductToOrderListEvent(
                                productId: widget.productId,
                                quantity: quantity,
                                note: '',
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: greyColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              minimumSize: const Size(140, 36)),
                          child: Text(
                            'Beli',
                            style: blackTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: bold,
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
