import 'package:antria_mobile_pelanggan/features/auth/presentation/pages/login_page.dart';
import 'package:antria_mobile_pelanggan/features/auth/presentation/pages/register_page.dart';
import 'package:antria_mobile_pelanggan/features/detail_order/presentation/pages/detail_order.dart';
import 'package:antria_mobile_pelanggan/features/detail_order/presentation/pages/success_payment.dart';
import 'package:antria_mobile_pelanggan/features/ewallet/presentation/pages/ewallet_page.dart';
import 'package:antria_mobile_pelanggan/features/history/presentation/pages/history_page.dart';
import 'package:antria_mobile_pelanggan/features/history/presentation/pages/order_recipt_page.dart';
import 'package:antria_mobile_pelanggan/features/home/presentation/pages/home_page.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/presentation/pages/info_restaurant.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/presentation/pages/restaurant_address.dart';
import 'package:antria_mobile_pelanggan/features/profile/presentation/pages/contact_support_page.dart';
import 'package:antria_mobile_pelanggan/features/profile/presentation/pages/edit_profile_page.dart';
import 'package:antria_mobile_pelanggan/features/profile/presentation/pages/profile_page.dart';
import 'package:antria_mobile_pelanggan/features/queue/presentation/pages/queue_page.dart';
import 'package:antria_mobile_pelanggan/features/rating/presentation/pages/rating_page.dart';
import 'package:antria_mobile_pelanggan/features/search_page/presentation/pages/search_page.dart';
import 'package:antria_mobile_pelanggan/features/success_order/presentation/pages/success_order.dart';
import 'package:antria_mobile_pelanggan/features/thanks_page/presentation/pages/thanks_page.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/pages/splash_page.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoutes(RouteSettings settings) {
    // Corrected return type
    switch (settings.name) {
      case '/':
        return _materialRoute(const SplashPage());

      case '/login-page':
        return _materialRoute(const LoginPage());

      case '/sign-up':
        return _materialRoute(const RegisterPage());

      case '/splash-page':
        return _materialRoute(const SplashPage());

      case '/home-page':
        return _materialRoute(const HomePage());

      case '/search-page':
        final isBottomNav = settings.arguments as bool? ?? false;
        return _materialRoute(
          SearchPage(
            isBottomNav: isBottomNav,
          ),
        );

      case '/queue-page':
        final args = settings.arguments as Map<String, dynamic>;
        final mitraId = args['mitraId'] as int;
        final invoice = args['invoice'] as String;
        return _materialRoute(
          QueuePage(
            mitraId: mitraId,
            invoice: invoice,
          ),
        );

      case '/profile-page':
        return _materialRoute(const ProfilePage());

      case '/edit-profile-page':
        return _materialRoute(const EditProfilePage());

      case '/ewallet-page':
        return _materialRoute(const EwalletPage());

      case '/contact-support-page':
        return _materialRoute(const ContactSupportPage());

      case '/detail-order':
        final mitraId = settings.arguments as int;
        return _materialRoute(DetailOrderPage(
          mitraId: mitraId,
        ));

      case '/success-payment':
        final invoice = settings.arguments as String;
        return _materialRoute(SuccessPayment(
          invoice: invoice,
        ));

      case '/history-page':
        return _materialRoute(const HistoryPage());

      case '/order-recipt-page':
        final invoice = settings.arguments as String;
        return _materialRoute(
          OrderRecipt(
            invoice: invoice,
          ),
        );

      case '/information-restaurant':
        final mitraId = settings.arguments as int;
        return _materialRoute(
          InfoRestaurantPage(
            mitraId: mitraId,
          ),
        );

      case '/restaurant-address':
        final linkGmaps = settings.arguments as String;
        return _materialRoute(
          RestaurantAddress(
            linkGmaps: linkGmaps,
          ),
        );

      case '/success-order-page':
        final mitraId = settings.arguments as int;
        return _materialRoute(
          SuccessOrderPage(
            mitraId: mitraId,
          ),
        );

      case '/rating-page':
        final mitraId = settings.arguments as int;
        return _materialRoute(RatingPage(
          mitraId: mitraId,
        ));

      case '/thanks-page':
        return _materialRoute(const ThanksPage());

      default:
        return _materialRoute(const LoginPage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
