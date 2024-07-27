import 'package:antria_mobile_pelanggan/shared/error_fetch_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:antria_mobile_pelanggan/core/utils/constant.dart';
import 'package:antria_mobile_pelanggan/features/home/data/models/response/get_restaurant_model.dart';
import 'package:antria_mobile_pelanggan/features/home/presentation/bloc/get_restaurant/get_restaurant_bloc.dart';
import 'package:antria_mobile_pelanggan/features/home/presentation/widgets/recomendation_resto.dart';

class ListSearchRestaurant extends StatefulWidget {
  final List<GetRestaurantResponse> menuItems;

  const ListSearchRestaurant({
    super.key,
    required this.menuItems,
  });

  @override
  _ListSearchRestaurantState createState() => _ListSearchRestaurantState();
}

class _ListSearchRestaurantState extends State<ListSearchRestaurant> {
  @override
  void initState() {
    super.initState();
    initializeDateFormatting('id_ID', null);
  }

  @override
  Widget build(BuildContext context) {
    // Sort menu items by review
    final sortedMenuItems = List<GetRestaurantResponse>.from(widget.menuItems)
      ..removeWhere((item) => item.review == null)
      ..sort((a, b) => b.review!.compareTo(a.review!));

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
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<GetRestaurantBloc, GetRestaurantState>(
              builder: (context, state) {
                if (state is RestaurantErrorState) {
                  return ErrorFetchData();
                } else if (state is RestaurantLoadedState) {
                  return ListView.separated(
                    itemCount: sortedMenuItems.length,
                    itemBuilder: (context, index) {
                      final menuItem = sortedMenuItems[index];
                      final rating = menuItem.review! / 10;

                      final closingTime = menuItem.jamTutup;
                      final openDaysString = menuItem.hariBuka;
                      final openDays = openDaysString?.split(',');

                      bool isClosed = false;
                      if (closingTime == null || openDays == null) {
                        isClosed = true;
                      } else {
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
