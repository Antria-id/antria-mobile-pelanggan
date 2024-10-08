import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/core/utils/constant.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/presentation/bloc/info_restaurant/info_restaurant_bloc.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/presentation/bloc/menu/menu_bloc.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/presentation/bloc/orderlist/order_list_bloc.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/presentation/widgets/cart_order.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/presentation/widgets/list_menu.dart';
import 'package:antria_mobile_pelanggan/shared/custom_button.dart';
import 'package:antria_mobile_pelanggan/shared/error_fetch_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

class InfoRestaurantPage extends StatefulWidget {
  final int mitraId;
  const InfoRestaurantPage({super.key, required this.mitraId});

  @override
  State<InfoRestaurantPage> createState() => _InfoRestaurantPageState();
}

class _InfoRestaurantPageState extends State<InfoRestaurantPage> {
  bool showCart = false;
  bool isClosed = false;
  late InfoRestaurantBloc _infoRestaurantBloc;

  @override
  void initState() {
    super.initState();
    _infoRestaurantBloc = InfoRestaurantBloc()
      ..add(InfoRestaurantUserEvent(mitraId: widget.mitraId));
    _infoRestaurantBloc.stream.listen((state) {
      if (state is InfoRestaurantLoadedState) {
        final closingTime = state.response.jamTutup;
        final openingTime = state.response.jamBuka;
        final openDaysString = state.response.hariBuka;
        final openDays = openDaysString?.split(',');

        final now = DateTime.now();
        final format = DateFormat("HH:mm");

        bool isOpenToday = true;
        DateTime? closingDateTime;
        DateTime? openingDateTime;

        if (openingTime != null && openingTime.isNotEmpty) {
          openingDateTime = format.parse(openingTime);
          openingDateTime = DateTime(now.year, now.month, now.day,
              openingDateTime.hour, openingDateTime.minute);
        }

        if (closingTime != null && closingTime.isNotEmpty) {
          closingDateTime = format.parse(closingTime);
          // Jika jam tutup lebih awal dari jam buka, tambahkan satu hari ke jam tutup
          if (closingTime.compareTo(openingTime!) < 0) {
            closingDateTime = DateTime(now.year, now.month, now.day + 1,
                closingDateTime.hour, closingDateTime.minute);
          } else {
            closingDateTime = DateTime(now.year, now.month, now.day,
                closingDateTime.hour, closingDateTime.minute);
          }
        }

        if (openDaysString != null && openDaysString.isNotEmpty) {
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
          isOpenToday = openDays!.contains(currentDay);
        } else {
          isOpenToday = false;
        }

        setState(() {
          isClosed = !isOpenToday ||
              state.response.statusToko == 'CLOSE' ||
              (openingDateTime != null &&
                  closingDateTime != null &&
                  !(now.isAfter(openingDateTime) &&
                      now.isBefore(closingDateTime))) ||
              closingTime == null ||
              closingTime.isEmpty ||
              openDaysString == null ||
              openDaysString.isEmpty;
        });
      }
    });
  }

  @override
  void dispose() {
    _infoRestaurantBloc.close();
    super.dispose();
  }

  Widget header() {
    return BlocProvider.value(
      value: _infoRestaurantBloc,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(16),
        child: BlocBuilder<InfoRestaurantBloc, InfoRestaurantState>(
          builder: (context, state) {
            if (state is InfoRestaurantErrorState) {
              return const ErrorFetchData();
            } else if (state is InfoRestaurantLoadedState) {
              final infoRestaurant = state.response;
              double initialRating = infoRestaurant.review != null
                  ? infoRestaurant.review! / 10.0
                  : 0.0;

              return Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          '${APIUrl.baseUrl}${APIUrl.imagePath}${infoRestaurant.gambarToko}',
                          fit: BoxFit.cover,
                          height: 172,
                          width: 172,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              'assets/images/empty_store.png',
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
                            top: 2,
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
                                  Text('$initialRating'),
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
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    width: 360,
                    height: 40,
                    title: 'Alamat Restoran',
                    sizeFont: 16,
                    radius: 8.0,
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/restaurant-address',
                        arguments: infoRestaurant.linkGmaps,
                      );
                    },
                  ),
                ],
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            final menuBloc = BlocProvider.of<MenuBloc>(context);
            menuBloc.add(ClearMenu());
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: whiteColor,
          ),
        ),
        title: Text(
          'Restoran',
          style: whiteTextStyle.copyWith(fontWeight: bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                MenuBloc()..add(MenuFetchData(mitraId: widget.mitraId)),
          ),
          BlocProvider(
            create: (context) => OrderListBloc(),
          ),
        ],
        child: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: BlocBuilder<MenuBloc, MenuState>(
                  builder: (context, state) {
                    if (state is MenuError) {
                      return Container(
                        height: 800,
                        child: const ErrorFetchData(),
                      );
                    } else if (state is MenuLoaded) {
                      return Column(
                        children: [
                          header(),
                          ListMenu(
                            productList: state.menu,
                            mitraId: widget.mitraId,
                            onBuyButtonPressed: () {
                              setState(() {
                                showCart = true;
                              });
                            },
                          ),
                        ],
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
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
                    ? Align(
                        alignment: Alignment.bottomCenter,
                        child: CartOrder(
                          onPress: () {
                            Navigator.pushNamed(
                              context,
                              '/detail-order',
                              arguments: widget.mitraId,
                            );
                          },
                        ),
                      )
                    : Container(),
              ),
              if (isClosed)
                Positioned.fill(
                  child: Container(
                    color: const Color(0xff333333).withOpacity(0.5),
                    child: Center(
                      child: Text(
                        'Restoran Tutup..',
                        style: whiteTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
