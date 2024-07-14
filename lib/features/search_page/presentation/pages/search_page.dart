import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/features/home/presentation/bloc/get_restaurant/get_restaurant_bloc.dart';
import 'package:antria_mobile_pelanggan/features/search_page/presentation/widgets/list_seacrh_restaurant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:antria_mobile_pelanggan/features/home/data/models/response/get_restaurant_model.dart';
import 'package:antria_mobile_pelanggan/features/search_page/presentation/widgets/search_bar_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

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
                  margin: EdgeInsets.only(top: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 28,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                SearchBarWidget(
                  onSearch: onSearch,
                ),
              ],
            ),
            BlocBuilder<GetRestaurantBloc, GetRestaurantState>(
              builder: (context, state) {
                if (state is RestaurantLoadingState) {
                  return Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (state is RestaurantLoadedState) {
                  allRestaurants = state.response ?? [];
                  return searchResults.isNotEmpty
                      ? Expanded(
                          child: SingleChildScrollView(
                            child: ListSearchRestaurant(
                              menuItems: searchResults,
                            ),
                          ),
                        )
                      : const Expanded(
                          child: Center(
                            child: Text(
                              'Cari Restoran',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        );
                } else if (state is RestaurantErrorState) {
                  return Expanded(
                    child: Center(
                      child: Text(
                        state.message,
                        style: TextStyle(fontSize: 18, color: Colors.red),
                      ),
                    ),
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
