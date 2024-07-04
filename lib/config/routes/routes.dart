import 'package:antria_mobile_pelanggan/features/auth/presentation/pages/login_page.dart';
import 'package:antria_mobile_pelanggan/features/auth/presentation/pages/register_page.dart';
import 'package:antria_mobile_pelanggan/features/chat/presentation/pages/chat_list_page.dart';
import 'package:antria_mobile_pelanggan/features/chat/presentation/pages/chat_page.dart';
import 'package:antria_mobile_pelanggan/features/detail_order/presentation/pages/detail_order.dart';
import 'package:antria_mobile_pelanggan/features/detail_order/presentation/pages/success_payment.dart';
import 'package:antria_mobile_pelanggan/features/history/presentation/pages/history_page.dart';
import 'package:antria_mobile_pelanggan/features/history/presentation/pages/order_recipt_page.dart';
import 'package:antria_mobile_pelanggan/features/home/presentation/pages/home_page.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/presentation/pages/info_restaurant.dart';
import 'package:antria_mobile_pelanggan/features/profile/presentation/pages/contact_support_page.dart';
import 'package:antria_mobile_pelanggan/features/profile/presentation/pages/edit_profile_page.dart';
import 'package:antria_mobile_pelanggan/features/profile/presentation/pages/profile_page.dart';
import 'package:antria_mobile_pelanggan/features/queue/presentation/pages/queue_page.dart';
import 'package:antria_mobile_pelanggan/features/rating/presentation/pages/rating_page.dart';
import 'package:antria_mobile_pelanggan/features/search_page/presentation/pages/search_page.dart';
import 'package:antria_mobile_pelanggan/features/success_order/presentation/pages/success_order.dart';
import 'package:antria_mobile_pelanggan/features/taking_queue/presentation/pages/taking_queue.dart';
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
        return _materialRoute(const SearchPage());

      case '/queue-page':
        return _materialRoute(const QueuePage());

      case '/profile-page':
        return _materialRoute(const ProfilePage());

      case '/edit-profile-page':
        return _materialRoute(const EditProfilePage());

      case '/contact-support-page':
        return _materialRoute(const ContactSupportPage());

      case '/detail-order':
        return _materialRoute(const DetailOrderPage());

      case '/success-payment':
        return _materialRoute(const SuccessPayment());

      case '/chat-list-page':
        return _materialRoute(const ChatListPage());

      case '/chat-page':
        return _materialRoute(const ChatPage());

      case '/history-page':
        return _materialRoute(const HistoryPage());

      case '/order-recipt-page':
        final invoice = settings.arguments as String;
        return _materialRoute(
          OrderRecipt(
            invoice: invoice,
          ),
        );

      case '/taking-queue-page':
        return _materialRoute(const TakingQueuePage());

      case '/information-restaurant':
        final mitraId = settings.arguments as int;
        return _materialRoute(
          InfoRestaurantPage(mitraId: mitraId),
        );

      case '/success-order-page':
        return _materialRoute(const SuccessOrderPage());

      case '/rating-page':
        return _materialRoute(const RatingPage());

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
