import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/auth/presentation/pages/login_page.dart';
import 'package:antria_mobile_pelanggan/features/home/domain/usecases/home/check_login_status_usecase.dart';
import 'package:antria_mobile_pelanggan/shared/bottom_navigation.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 3),
      () {
        serviceLocator<CheckUserLoginStatus>().checkIfUserLoggedIn().then(
          (isUserLoggedIn) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => isUserLoggedIn
                    ? const BottomNavigationWidget()
                    : const LoginPage(),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/images/antria.png',
          height: 140,
          width: 140,
        ),
      ),
    );
  }
}
