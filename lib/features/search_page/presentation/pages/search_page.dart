import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/features/home/presentation/bloc/get_restaurant/get_restaurant_bloc.dart';
import 'package:antria_mobile_pelanggan/features/search_page/presentation/widgets/list_seacrh_restaurant.dart';
import 'package:antria_mobile_pelanggan/shared/error_fetch_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:antria_mobile_pelanggan/features/home/data/models/response/get_restaurant_model.dart';
import 'package:antria_mobile_pelanggan/features/search_page/presentation/widgets/search_bar_widget.dart';

class SearchPage extends StatefulWidget {
  final bool isBottomNav;

  const SearchPage({super.key, required this.isBottomNav});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<GetRestaurantResponse> allRestaurants = [];
  List<GetRestaurantResponse> searchResults = [];

  @override
  void initState() {
    super.initState();
    context
        .read<GetRestaurantBloc>()
        .add(const GetRestaurantEvent.ongetRestaurant());
  }

  void onSearch(String keyword) {
    setState(() {
      if (keyword.isEmpty) {
        searchResults = [];
      } else {
        searchResults = allRestaurants
            .where((restaurant) =>
                restaurant.namaToko != null &&
                restaurant.namaToko!
                    .toLowerCase()
                    .contains(keyword.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: widget.isBottomNav
                      ? GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back_ios,
                            size: 28,
                          ),
                        )
                      : const SizedBox(),
                ),
                const SizedBox(
                  width: 8,
                ),
                SearchBarWidget(
                  onSearch: onSearch,
                ),
              ],
            ),
            BlocBuilder<GetRestaurantBloc, GetRestaurantState>(
              builder: (context, state) {
                if (state is RestaurantLoadingState) {
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (state is RestaurantLoadedState) {
                  allRestaurants = state.response;
                  return searchResults.isNotEmpty
                      ? Expanded(
                          child: SingleChildScrollView(
                            child: ListSearchRestaurant(
                              menuItems: searchResults,
                            ),
                          ),
                        )
                      : Expanded(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/search_illustration.jpg',
                                  width: 300,
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                Text(
                                  'Cari Restoran',
                                  style: blackTextStyle.copyWith(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        );
                } else if (state is RestaurantErrorState) {
                  return Container(
                    height: 600,
                    child: const ErrorFetchData(),
                  );
                }
                return const Expanded(
                  child: Center(
                    child: Text(
                      'Restoran Tidak Ditemukan',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
