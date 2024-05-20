import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/presentation/bloc/info_restaurant/info_restaurant_bloc.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/presentation/bloc/menu_restaurant/menu_restaurant_bloc.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/presentation/widgets/cart_order.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/presentation/widgets/custom_buttton_service.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/presentation/widgets/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class InfoRestaurantPage extends StatefulWidget {
  final int mitraId;
  const InfoRestaurantPage({super.key, required this.mitraId});

  @override
  State<InfoRestaurantPage> createState() => _InfoRestaurantPageState();
}

class _InfoRestaurantPageState extends State<InfoRestaurantPage> {
  bool showCart = false;
  bool isSelected = false;
  bool isSelectedDineIn = true;
  bool isSelectedTakeaway = false;

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return BlocProvider(
        create: (context) => InfoRestaurantBloc()
          ..add(InfoRestaurantUserEvent(mitraId: widget.mitraId)),
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(16),
          child: BlocBuilder<InfoRestaurantBloc, InfoRestaurantState>(
            builder: (context, state) {
              if (state is InfoRestaurantErrorState) {
                return Center(
                  child: Text(state.message),
                );
              } else if (state is InfoRestaurantLoadedState) {
                final infoRestaurant = state.response;
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        infoRestaurant.gambarToko!,
                        fit: BoxFit.cover,
                        height: 172,
                        width: 172,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            'assets/images/restoran1.png',
                            fit: BoxFit.cover,
                            height: 172,
                            width: 172,
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(
                          top: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              infoRestaurant.namaToko!,
                              style: blackTextStyle.copyWith(
                                fontSize: 18,
                                fontWeight: bold,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              infoRestaurant.alamat!,
                              style: greyTextStyle.copyWith(
                                fontSize: 8,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${infoRestaurant.jamBuka!} - ${infoRestaurant.jamTutup}',
                              style: blackTextStyle.copyWith(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              infoRestaurant.hariBuka!,
                              style: blackTextStyle.copyWith(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            RatingBar.builder(
                              initialRating: 5,
                              direction: Axis.horizontal,
                              itemCount: 5,
                              itemSize: 16.0,
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              ignoreGestures: true,
                              onRatingUpdate: (double value) {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      );
    }

    Widget service() {
      return Container(
        margin: const EdgeInsets.only(
          top: 20,
          left: 22,
        ),
        child: Row(
          children: [
            CustomButtonService(
              title: 'Dine In',
              isSelected: isSelectedDineIn,
              onTap: () {
                setState(() {
                  isSelectedDineIn = true;
                  isSelectedTakeaway = false;
                });
              },
            ),
            CustomButtonService(
              title: 'Takeaway',
              isSelected: isSelectedTakeaway,
              onTap: () {
                setState(
                  () {
                    isSelectedTakeaway = !isSelectedTakeaway;
                    isSelectedDineIn = false;
                  },
                );
              },
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 0,
      ),
      body: BlocProvider(
        create: (context) => MenuRestaurantBloc()
          ..add(MenuRestaurantUserEvent(mitraId: widget.mitraId)),
        child: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: BlocBuilder<MenuRestaurantBloc, MenuRestaurantState>(
                  builder: (context, state) {
                    if (state is MenuRestaurantErrorState) {
                      return Center(
                        child: Text(state.message),
                      );
                    } else if (state is MenuRestaurantLoadedState) {
                      return Column(
                        children: [
                          header(),
                          service(),
                          Menu(
                            menuItems: state.response,
                            mitraId: widget.mitraId,
                            onPress: () {
                              setState(() {
                                showCart = true;
                              });
                            },
                          ),
                        ],
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
              if (showCart)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CartOrder(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
