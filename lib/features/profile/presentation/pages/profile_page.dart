import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/features/profile/presentation/bloc/pelanggan_profile/pelanggan_profile_bloc.dart';
import 'package:antria_mobile_pelanggan/features/profile/presentation/widgets/logout_button_widget.dart';
import 'package:antria_mobile_pelanggan/features/profile/presentation/widgets/profile_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PelangganProfileBloc()..add(const GetPelangganFetchDataEvent()),
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 280,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(26),
                      bottomRight: Radius.circular(26),
                    ),
                  ),
                  child: SafeArea(
                    child: BlocBuilder<PelangganProfileBloc,
                        PelangganProfileState>(
                      builder: (context, state) {
                        if (state is PelangganProfileStateErrorState) {
                          return Center(
                            child: Text('Error: ${state.message}'),
                          );
                        } else if (state is PelangganProfileStateLoadedState) {
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
                                        fontWeight: FontWeight.bold,
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
                                        InkWell(
                                          onTap: () => Navigator.pushNamed(
                                            context,
                                            '/edit-profile-page',
                                          ),
                                          child: const CircleAvatar(
                                            radius: 15,
                                            backgroundColor: whiteColor,
                                            child: Icon(
                                              Icons.edit,
                                              color: blackColor,
                                              size: 18,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Text(
                                      profileData.nama ?? 'Guest',
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
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 26,
            ),
            ProfileButtonWidget(
              icon: 'assets/icons/star.png',
              text: 'Rating & Ulasan',
              onTap: () => Navigator.pushNamed(context, '/ulasan'),
            ),
            const SizedBox(
              height: 26,
            ),
            ProfileButtonWidget(
              icon: 'assets/icons/support.png',
              text: 'Contact Support',
              onTap: () => Navigator.pushNamed(
                context,
                '/contact-support-page',
              ),
            ),
            const SizedBox(
              height: 26,
            ),
            const LogoutButtonWidget(),
          ],
        ),
      ),
    );
  }
}
