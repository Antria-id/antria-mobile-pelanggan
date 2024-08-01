import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/features/home/presentation/bloc/user/user_bloc.dart';
import 'package:antria_mobile_pelanggan/features/profile/presentation/widgets/card_profile_header.dart';
import 'package:antria_mobile_pelanggan/features/profile/presentation/widgets/logout_button_widget.dart';
import 'package:antria_mobile_pelanggan/features/profile/presentation/widgets/profile_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc()
        ..add(
          UserFetchData(),
        ),
      child: Scaffold(
        backgroundColor: backgroundGreyColor,
        body: Column(
          children: [
            CardProfileHeader(),
            const SizedBox(
              height: 26,
            ),
            ProfileButtonWidget(
              icon: 'assets/icons/ewallet.png',
              text: 'E-Wallet',
              onTap: () => Navigator.pushNamed(
                context,
                '/ewallet-page',
              ),
            ),
            const SizedBox(
              height: 20,
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
