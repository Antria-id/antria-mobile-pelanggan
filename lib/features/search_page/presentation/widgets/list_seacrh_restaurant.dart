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
  final List<GetRestaurantResponse> restoItems;

  const ListSearchRestaurant({
    super.key,
    required this.restoItems,
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
    // Sort menu items by review, handling null reviews
    final sortedrestoItems = List<GetRestaurantResponse>.from(widget.restoItems)
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
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<GetRestaurantBloc, GetRestaurantState>(
              builder: (context, state) {
                if (state is RestaurantErrorState) {
                  return const ErrorFetchData();
                } else if (state is RestaurantLoadedState) {
                  return ListView.separated(
                    itemCount: sortedrestoItems.length,
                    itemBuilder: (context, index) {
                      final menuItem = sortedrestoItems[index];
                      final rating =
                          menuItem.review != null ? menuItem.review! / 10 : 0.0;

                      final openingTime = menuItem.jamBuka;
                      final closingTime = menuItem.jamTutup;
                      final openDaysString = menuItem.hariBuka;
                      final openDays = openDaysString?.split(',');

                      bool isClosed = openingTime == null ||
                          closingTime == null ||
                          openDays == null ||
                          menuItem.statusToko == 'CLOSE';

                      if (!isClosed) {
                        try {
                          final format = DateFormat("HH:mm");
                          DateTime openingDateTime = format.parse(openingTime);
                          DateTime closingDateTime = format.parse(closingTime);

                          openingDateTime = DateTime(
                            now.year,
                            now.month,
                            now.day,
                            openingDateTime.hour,
                            openingDateTime.minute,
                          );

                          // Adjust closing time if it is past midnight
                          if (closingTime.compareTo(openingTime) < 0) {
                            closingDateTime = DateTime(
                              now.year,
                              now.month,
                              now.day + 1, // Move to the next day
                              closingDateTime.hour,
                              closingDateTime.minute,
                            );
                          } else {
                            closingDateTime = DateTime(
                              now.year,
                              now.month,
                              now.day,
                              closingDateTime.hour,
                              closingDateTime.minute,
                            );
                          }

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

                          isClosed = now.isBefore(openingDateTime) ||
                              now.isAfter(closingDateTime) ||
                              !openDays.contains(currentDay);
                        } catch (e) {
                          print("Error parsing time: $e");
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
