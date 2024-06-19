import 'package:antria_mobile_pelanggan/core/utils/constant.dart';
import 'package:antria_mobile_pelanggan/features/detail_order/presentation/widgets/card_detail_order.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/presentation/bloc/orderlist/order_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListCardOrder extends StatelessWidget {
  const ListCardOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderListBloc()
        ..add(
          GetProductsInOrderListEvent(),
        ),
      child: BlocBuilder<OrderListBloc, OrderListState>(
        builder: (context, state) {
          if (state is OrderListLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is OrderListLoaded) {
            return SizedBox(
              height: 260,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 20),
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  final cart = state.products[index];
                  return CardDetailOrder(
                    imageUrl:
                        '${APIUrl.baseUrl}${APIUrl.imagePath}${cart['gambar']}',
                    name: cart['nama_produk'],
                    price: cart['harga'],
                    kuantitas: cart['quantity'],
                    productId: cart['id'],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
              ),
            );
          } else if (state is ProductAddedToOrderList) {
            BlocProvider.of<OrderListBloc>(context)
                .add(GetProductsInOrderListEvent());
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
