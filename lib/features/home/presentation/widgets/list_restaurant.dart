import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart'; // Import for initializing locale data
import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/core/utils/constant.dart';
import 'package:antria_mobile_pelanggan/features/home/data/models/response/get_restaurant_model.dart';
import 'package:antria_mobile_pelanggan/features/home/presentation/bloc/get_restaurant/get_restaurant_bloc.dart';
import 'package:antria_mobile_pelanggan/features/home/presentation/widgets/recomendation_resto.dart';

class ListRestaurant extends StatefulWidget {
  final List<GetRestaurantResponse> menuItems;
  final bool isHome;

  const ListRestaurant({
    super.key,
    required this.menuItems,
    required this.isHome,
  });

  @override
  _ListRestaurantState createState() => _ListRestaurantState();
}

class _ListRestaurantState extends State<ListRestaurant> {
  @override
  void initState() {
    super.initState();
    // Initialize locale data for Indonesian
    initializeDateFormatting('id_ID', null);
  }

  @override
  Widget build(BuildContext context) {
    // Sort menu items by review, handling null reviews
    final sortedMenuItems = List<GetRestaurantResponse>.from(widget.menuItems)
      ..sort((a, b) {
        if (a.review == null && b.review == null) {
          return 0;
        } else if (a.review == null) {
          return 1;
        } else if (b.review == null) {
          return -1;
        } else {
          return b.review!.compareTo(a.review!);
        }
      });

    // Get current day in Indonesian locale
    final now = DateTime.now();

    return BlocProvider<GetRestaurantBloc>(
      create: (context) =>
          GetRestaurantBloc()..add(const RestaurantUserEvent()),
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
            const SizedBox(height: 20),
            Text(
              'Rekomendasi Untukmu',
              style: greyTextStyle.copyWith(
                fontSize: 20,
                fontWeight: medium,
              ),
            ),
            const SizedBox(height: 20),
            BlocBuilder<GetRestaurantBloc, GetRestaurantState>(
              builder: (context, state) {
                if (state is RestaurantErrorState) {
                  return Center(
                    child: Text(state.message),
                  );
                } else if (state is RestaurantLoadedState) {
                  return ListView.separated(
                    itemCount: widget.isHome ? 5 : sortedMenuItems.length,
                    itemBuilder: (context, index) {
                      final menuItem = sortedMenuItems[index];
                      final rating =
                          menuItem.review != null ? menuItem.review! / 10 : 0.0;

                      final closingTime = menuItem.jamTutup;
                      final openDaysString = menuItem.hariBuka;
                      final openDays = openDaysString?.split(',');

                      bool isClosed = closingTime == null || openDays == null;

                      if (!isClosed) {
                        try {
                          final format = DateFormat("HH:mm");
                          DateTime closingDateTime = format.parse(closingTime);
                          closingDateTime = DateTime(
                            now.year,
                            now.month,
                            now.day,
                            closingDateTime.hour,
                            closingDateTime.minute,
                          );

                          final daysOfWeek = [
                            'Minggu',
                            'Senin',
                            'Selasa',
                            'Rabu',
                            'Kamis',
                            'Jumat',
                            'Sabtu'
                          ];
                          final currentDay = daysOfWeek[now.weekday % 7];

                          isClosed = now.isAfter(closingDateTime) ||
                              menuItem.statusToko == 'CLOSE' ||
                              !openDays.contains(currentDay);
                        } catch (e) {
                          print("Error parsing closing time: $e");
                          isClosed = true;
                        }
                      }

                      return RecomendationResto(
                        name: menuItem.namaToko!,
                        address: menuItem.alamat!,
                        imageUrl:
                            '${APIUrl.baseUrl}${APIUrl.imagePath}${menuItem.gambarToko}',
                        rating: rating,
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/information-restaurant',
                            arguments: menuItem.id,
                          );
                        },
                        isDisabled: isClosed,
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ],
        ),
      ),
    );
  }
}
