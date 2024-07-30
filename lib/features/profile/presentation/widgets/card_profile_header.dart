import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/core/utils/constant.dart';
import 'package:antria_mobile_pelanggan/features/profile/presentation/bloc/pelanggan_profile/pelanggan_profile_bloc.dart';
import 'package:antria_mobile_pelanggan/features/profile/presentation/widgets/edit_profile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardProfileHeader extends StatelessWidget {
  const CardProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 340,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(14),
              bottomRight: Radius.circular(14),
            ),
          ),
          child: SafeArea(
            child: BlocBuilder<PelangganProfileBloc, PelangganProfileState>(
              builder: (context, state) {
                if (state is PelangganProfileError) {
                  return Container(
                    height: 800,
                    child: const Center(
                      child: Text(
                        'Error fetching data...',
                      ),
                    ),
                  );
                } else if (state is PelangganProfileLoaded) {
                  final profileData = state.pelangganModel;
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Profile',
                              style: whiteTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: bold,
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Stack(
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
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              profileData.username!,
                              style: whiteTextStyle.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              profileData.email!,
                              style: whiteTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else if (state is UserLocalLoaded) {
                  final profileData = state.user;
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Profile',
                              style: whiteTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: bold,
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundImage: const NetworkImage(
                                    'https://icon-library.com/images/avatar-icon-images/avatar-icon-images-4.jpg',
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              profileData.username!,
                              style: whiteTextStyle.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              'email',
                              style: whiteTextStyle,
                            ),
                          ],
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
        ),
        const EditProfileCard(),
      ],
    );
  }
}
