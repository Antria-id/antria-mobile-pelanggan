import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/presentation/bloc/orderlist/order_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CardDetailOrder extends StatefulWidget {
  final int productId;
  final String imageUrl;
  final String name;
  final int price;
  final int kuantitas;
  const CardDetailOrder({
    super.key,
    required this.productId,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.kuantitas,
  });

  @override
  State<CardDetailOrder> createState() => _CardDetailOrderState();
}

class _CardDetailOrderState extends State<CardDetailOrder>
    with AutomaticKeepAliveClientMixin {
  late int quantity;
  @override
  void initState() {
    super.initState();
    quantity = widget.kuantitas;
  }

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    String formattedPrice = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    ).format(widget.price);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
                child: Image.network(
                  widget.imageUrl,
                  width: 90,
                  height: 90,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/images/menu1.jpg',
                      width: 90,
                      height: 90,
                    );
                  },
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name.length > 20
                        ? '${widget.name.substring(0, 20)}...'
                        : widget.name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    formattedPrice,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xff0D1039),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
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
                            quantity;
                          });
                        }
                        final orderList = BlocProvider.of<OrderListBloc>(
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
                            fontWeight: FontWeight.bold,
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
                          quantity++;
                        });
                        final orderList = BlocProvider.of<OrderListBloc>(
                          context,
                        );
                        orderList.add(
                          IncrementQuantityEvent(
                            productId: widget.productId,
                            quantity: quantity,
                          ),
                        );
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
        ],
      ),
    );
  }
}
