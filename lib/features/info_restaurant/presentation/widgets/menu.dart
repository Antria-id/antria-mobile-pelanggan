import 'package:antria_mobile_pelanggan/features/info_restaurant/data/models/get_menu_model.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/presentation/bloc/menu_restaurant/menu_restaurant_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'card_menu.dart';

class Menu extends StatefulWidget {
  final List<GetMenuResponse> menuItems;
  final int mitraId;
  final VoidCallback onPress;
  const Menu({
    super.key,
    required this.onPress,
    required this.menuItems,
    required this.mitraId,
  });

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  bool showCart = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MenuRestaurantBloc()
        ..add(MenuRestaurantUserEvent(mitraId: widget.mitraId)),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: BlocBuilder<MenuRestaurantBloc, MenuRestaurantState>(
          builder: (context, state) {
            if (state is MenuRestaurantErrorState) {
              return Center(
                child: Text(state.message),
              );
            } else if (state is MenuRestaurantLoadedState) {
              return GridView.builder(
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
                itemCount: widget.menuItems.length,
                itemBuilder: (BuildContext context, int index) {
                  final menuItem = widget.menuItems[index];
                  return CardMenu(
                    title: menuItem.namaProduk!,
                    desc: menuItem.deskripsiProduk!,
                    price: menuItem.harga!,
                    imageUrl: menuItem.gambar!,
                    // promo: menuItem[index]['promo'] ?? false,
                    onPress: widget.onPress,
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
