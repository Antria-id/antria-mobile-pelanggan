import 'package:antria_mobile_pelanggan/core/utils/constant.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/data/models/get_menu_model.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/presentation/bloc/menu/menu_bloc.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/presentation/widgets/card_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListMenu extends StatelessWidget {
  final List<GetMenuResponse> productList;
  final VoidCallback onBuyButtonPressed;
  final int mitraId;
  const ListMenu({
    super.key,
    required this.productList,
    required this.onBuyButtonPressed,
    required this.mitraId,
  });

  @override
  Widget build(BuildContext context) {
    if (productList.isEmpty) {
      return const Center(
        child: Text(
          'Menu Belum Tersedia',
        ),
      );
    }
    return BlocProvider(
      create: (context) => MenuBloc()
        ..add(
          MenuFetchData(mitraId: mitraId),
        ),
      child: SizedBox(
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
            bottom: 70,
            top: 10,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12.0,
            crossAxisSpacing: 12.0,
            childAspectRatio: 0.7,
          ),
          itemCount: productList.length,
          itemBuilder: (context, index) {
            final product = productList[index];
            return CardMenu(
              image: '${APIUrl.baseUrl}${APIUrl.imagePath}${product.gambar}',
              productName: product.namaProduk ?? '',
              productPrice: product.harga ?? 0,
              onPressed: onBuyButtonPressed,
              stock: product.kuantitas ?? 0,
              productId: product.id!,
            );
          },
        ),
      ),
    );
  }
}
