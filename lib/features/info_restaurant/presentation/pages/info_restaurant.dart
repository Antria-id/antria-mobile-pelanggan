import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/presentation/bloc/info_restaurant/info_restaurant_bloc.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/presentation/bloc/menu/menu_bloc.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/presentation/bloc/orderlist/order_list_bloc.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/presentation/widgets/cart_order.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/presentation/widgets/custom_buttton_service.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/presentation/widgets/list_menu.dart';
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
                return const SizedBox();
              } else if (state is InfoRestaurantLoadedState) {
                final infoRestaurant = state.response;
                double initialRating = infoRestaurant.review != null
                    ? infoRestaurant.review! / 10.0
                    : 0.0;
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
                            Row(
                              children: [
                                Text(
                                  '${initialRating}',
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                RatingBar.builder(
                                  initialRating: initialRating,
                                  direction: Axis.horizontal,
                                  itemCount: 5,
                                  allowHalfRating: true,
                                  itemSize: 16.0,
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  ignoreGestures: true,
                                  onRatingUpdate: (double value) {},
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
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

    Widget service() {
      return Container(
        margin: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 22,
        ),
        child: Row(
          children: [
            Flexible(
              child: CustomButtonService(
                title: 'Dine In',
                isSelected: isSelectedDineIn,
                onTap: () {
                  setState(() {
                    isSelectedDineIn = true;
                    isSelectedTakeaway = false;
                  });
                },
              ),
            ),
            const SizedBox(
              width: 10,
            ), // Add some spacing between buttons if needed
            Flexible(
              child: CustomButtonService(
                title: 'Takeaway',
                isSelected: isSelectedTakeaway,
                onTap: () {
                  setState(
                    () {
                      isSelectedTakeaway = true;
                      isSelectedDineIn = false;
                    },
                  );
                },
              ),
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
        create: (context) => MenuBloc()
          ..add(
            MenuFetchData(
              mitraId: widget.mitraId,
            ),
          ),
        child: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: BlocBuilder<MenuBloc, MenuState>(
                  builder: (context, state) {
                    if (state is MenuError) {
                      return Container(
                        height: 800,
                        child: const Center(
                          child: Text(
                            'Error fetching data...',
                          ),
                        ),
                      );
                    } else if (state is MenuLoaded) {
                      return Column(
                        children: [
                          header(),
                          service(),
                          ListMenu(
                            productList: state.menu,
                            mitraId: widget.mitraId,
                            onBuyButtonPressed: () {
                              setState(() {
                                showCart = true;
                              });
                              final orderListBloc =
                                  BlocProvider.of<OrderListBloc>(context);
                              if (orderListBloc.state is OrderListLoaded &&
                                  (orderListBloc.state as OrderListLoaded)
                                      .products
                                      .isNotEmpty) {
                                setState(() {
                                  showCart = true;
                                });
                              }
                            },
                          ),
                        ],
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
              BlocListener<OrderListBloc, OrderListState>(
                listener: (context, state) {
                  if (state is OrderListLoaded) {
                    setState(() {
                      showCart = state.products.isNotEmpty;
                    });
                  }
                },
                child: showCart
                    ? const Align(
                        alignment: Alignment.bottomCenter,
                        child: CartOrder(),
                      )
                    : Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
