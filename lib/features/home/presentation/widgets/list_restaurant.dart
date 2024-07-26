import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/core/utils/constant.dart';
import 'package:antria_mobile_pelanggan/features/home/data/models/response/get_restaurant_model.dart';
import 'package:antria_mobile_pelanggan/features/home/presentation/bloc/get_restaurant/get_restaurant_bloc.dart';
import 'package:antria_mobile_pelanggan/features/home/presentation/widgets/recomendation_resto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListRestaurant extends StatelessWidget {
  final List<GetRestaurantResponse> menuItems;
  final bool isHome;
  const ListRestaurant({
    super.key,
    required this.menuItems,
    required this.isHome,
  });

  @override
  Widget build(BuildContext context) {
    final sortedMenuItems = List<GetRestaurantResponse>.from(menuItems)
      ..removeWhere((item) => item.review == null)
      ..sort((a, b) => b.review!.compareTo(a.review!));

    return BlocProvider<GetRestaurantBloc>(
      create: (context) => GetRestaurantBloc()
        ..add(
          const RestaurantUserEvent(),
        ),
      child: Container(
        margin: const EdgeInsets.only(
          top: 20,
          bottom: 70,
          left: 10,
          right: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              'Rekomendasi Untukmu',
              style: greyTextStyle.copyWith(
                fontSize: 20,
                fontWeight: medium,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<GetRestaurantBloc, GetRestaurantState>(
              builder: (context, state) {
                if (state is RestaurantErrorState) {
                  return Center(
                    child: Text(state.message),
                  );
                } else if (state is RestaurantLoadedState) {
                  return ListView.separated(
                    itemCount: isHome ? 5 : sortedMenuItems.length,
                    itemBuilder: (context, index) {
                      final menuItem = sortedMenuItems[index];
                      final rating = menuItem.review! / 10;
                      return RecomendationResto(
                        name: menuItem.namaToko!,
                        address: menuItem.alamat!,
                        imageUrl:
                            '${APIUrl.baseUrl}${APIUrl.imagePath}${menuItem.gambarToko}',
                        rating: rating,
                        onPressed: () {
                          if (menuItem.id != null &&
                              menuItem.statusToko != 'CLOSE') {
                            Navigator.pushNamed(
                              context,
                              '/information-restaurant',
                              arguments: menuItem.id,
                            );
                          }
                        },
                        statusResto: menuItem.statusToko!,
                        isDisabled: menuItem.statusToko == 'CLOSE',
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
