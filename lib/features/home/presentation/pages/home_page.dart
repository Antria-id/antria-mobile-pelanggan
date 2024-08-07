import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/core/utils/constant.dart';
import 'package:antria_mobile_pelanggan/features/ewallet/presentation/bloc/ewallet_bloc.dart';
import 'package:antria_mobile_pelanggan/features/ewallet/presentation/widgets/card_ballance.dart';
import 'package:antria_mobile_pelanggan/features/profile/presentation/bloc/pelanggan_profile/pelanggan_profile_bloc.dart';
import 'package:antria_mobile_pelanggan/shared/error_fetch_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/get_restaurant/get_restaurant_bloc.dart';
import '../widgets/list_restaurant.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  String getGreeting() {
    final hour = TimeOfDay.now().hour;
    if (hour < 12) {
      return 'Selamat Pagi';
    } else if (hour < 15) {
      return 'Selamat Siang';
    } else if (hour < 18) {
      return 'Selamat Sore';
    } else {
      return 'Selamat Malam';
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return BlocProvider(
        create: (context) =>
            PelangganProfileBloc()..add(PelangganProfileFetchData()),
        child: Container(
          width: double.infinity,
          height: 222,
          decoration: const BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(
                10,
              ),
              bottomRight: Radius.circular(
                10,
              ),
            ),
          ),
          child: BlocBuilder<PelangganProfileBloc, PelangganProfileState>(
            builder: (context, state) {
              if (state is PelangganProfileError) {
                return const SizedBox();
              } else if (state is PelangganProfileLoaded) {
                final profileData = state.pelangganModel;
                return Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                    left: 20,
                    right: 20,
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hi, ${getGreeting()}',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  profileData.username ?? 'Member',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 24,
                                    fontWeight: bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/profile-page');
                            },
                            child: Container(
                              width: 56,
                              height: 56,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundImage:
                                        profileData.profilePicture!.isNotEmpty
                                            ? NetworkImage(
                                                '${APIUrl.baseUrl}${APIUrl.imagePath}${profileData.profilePicture}',
                                              )
                                            : const NetworkImage(
                                                'https://icon-library.com/images/avatar-icon-images/avatar-icon-images-4.jpg',
                                              ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 24,
                        ),
                      ),
                      // const SearchBarHome(),
                      BlocListener<EwalletBloc, EwalletState>(
                        listener: (context, state) {
                          if (state is EwalletSuccess) {
                            context.read<PelangganProfileBloc>().add(
                                  PelangganProfileFetchData(),
                                );
                          }
                        },
                        child: CardBallance(
                          balance: profileData.wallet!,
                          isHome: true,
                        ),
                      )
                    ],
                  ),
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

    return BlocProvider<GetRestaurantBloc>(
        create: (context) => GetRestaurantBloc()
          ..add(
            const RestaurantUserEvent(),
          ),
        child: Scaffold(
          backgroundColor: backgroundGreyColor,
          appBar: AppBar(
            backgroundColor: primaryColor,
            elevation: 0,
            automaticallyImplyLeading: false,
            toolbarHeight: 0,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  BlocBuilder<GetRestaurantBloc, GetRestaurantState>(
                    builder: (context, state) {
                      if (state is RestaurantErrorState) {
                        return Container(
                          height: 700,
                          child: const ErrorFetchData(),
                        );
                      } else if (state is RestaurantLoadedState) {
                        return Column(
                          children: [
                            header(),
                            ListRestaurant(
                              isHome: true,
                              restoItems: state.response,
                            ),
                          ],
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
          ),
        ));
  }
}
