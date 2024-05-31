import 'package:antria_mobile_pelanggan/features/home/data/models/response/get_restaurant_model.dart';
import 'package:antria_mobile_pelanggan/features/home/presentation/bloc/get_restaurant/get_restaurant_bloc.dart';
import 'package:antria_mobile_pelanggan/features/home/presentation/widgets/recomendation_resto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListSearchRestaurant extends StatelessWidget {
  final List<GetRestaurantResponse> menuItems;
  const ListSearchRestaurant({
    super.key,
    required this.menuItems,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetRestaurantBloc>(
      create: (context) => GetRestaurantBloc()
        ..add(
          const RestaurantUserEvent(),
        ),
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<GetRestaurantBloc, GetRestaurantState>(
              builder: (context, state) {
                if (state is RestaurantErrorState) {
                  return Center(
                    child: Text(state.message),
                  );
                } else if (state is RestaurantLoadedState) {
                  return ListView.separated(
                    itemCount: menuItems.length,
                    itemBuilder: (context, index) {
                      final menuItem = menuItems[index];
                      return RecomendationResto(
                        name: menuItem.namaToko!,
                        address: menuItem.alamat!,
                        imageUrl: menuItem.gambarToko!,
                        rating: menuItem.review! / 10,
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/information-restaurant',
                            arguments: menuItem.id,
                          );
                        },
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                    physics: const BouncingScrollPhysics(),
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
