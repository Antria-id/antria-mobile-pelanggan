import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/features/data/models/response/get_restaurant_model.dart';
import 'package:antria_mobile_pelanggan/features/home/presentation/widgets/recomendation_resto.dart';
import 'package:flutter/cupertino.dart';

class ListRestaurant extends StatelessWidget {
  final List<GetRestaurantResponse> menuItems;
  const ListRestaurant({super.key, required this.menuItems});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 80,
        horizontal: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
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
            height: 10,
          ),
          ListView.separated(
            itemCount: menuItems.length,
            itemBuilder: (context, index) {
              final menuItem = menuItems[index];
              return RecomendationResto(
                name: menuItem.namaToko!,
                address: menuItem.alamat!,
                imageUrl: menuItem.gambarToko!,
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 16),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
          ),
        ],
      ),
    );
  }
}
