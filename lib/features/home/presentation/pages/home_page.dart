import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/features/profile/presentation/bloc/pelanggan_profile/pelanggan_profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/get_restaurant/get_restaurant_bloc.dart';
import '../widgets/list_restaurant.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return BlocProvider(
        create: (context) =>
            PelangganProfileBloc()..add(const GetPelangganFetchDataEvent()),
        child: Container(
          width: double.infinity,
          height: 262,
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
              if (state is PelangganProfileStateErrorState) {
                return Center(
                  child: Text('Error: ${state.message}'),
                );
              } else if (state is PelangganProfileStateLoadedState) {
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
                                  'Hi, Good Morning',
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
                                    backgroundColor: primaryColor,
                                    child: Image.network(
                                      profileData.profilePicture!,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              const CircleAvatar(
                                        radius: 50,
                                        backgroundImage: NetworkImage(
                                          'https://icon-library.com/images/avatar-icon-images/avatar-icon-images-4.jpg',
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          top: 20,
                        ),
                      ),
                      Container(
                        width: 322,
                        child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 6,
                              horizontal: 12,
                            ),
                            filled: true,
                            fillColor: greyColor,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                8,
                              ),
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                            hintText: 'Search',
                            hintStyle: const TextStyle(
                              fontSize: 14,
                              color: fontGreycolor,
                            ),
                            suffixIcon: const Icon(Icons.search),
                          ),
                        ),
                      ),
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
                        return Center(
                          child: Text(state.message),
                        );
                      } else if (state is RestaurantLoadedState) {
                        return Column(
                          children: [
                            header(),
                            ListRestaurant(menuItems: state.response),
                          ],
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                  Positioned(
                    top: 160,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 200,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 20),
                            width: 356,
                            height: 178,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/banner1.png'),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 20),
                            width: 356,
                            height: 178,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/banner1.png'),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            width: 356,
                            height: 178,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/banner1.png'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
