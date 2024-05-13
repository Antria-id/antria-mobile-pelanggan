import 'package:antria_mobile_pelanggan/features/presentation/pages/chat_page.dart';
import 'package:antria_mobile_pelanggan/features/presentation/pages/detail_order.dart';
import 'package:antria_mobile_pelanggan/features/presentation/pages/history_page.dart';
import 'package:antria_mobile_pelanggan/features/presentation/pages/home_page.dart';
import 'package:antria_mobile_pelanggan/features/presentation/pages/info_restaurant.dart';
import 'package:antria_mobile_pelanggan/features/presentation/pages/login_page.dart';
import 'package:antria_mobile_pelanggan/features/presentation/pages/queue_page.dart';
import 'package:antria_mobile_pelanggan/features/presentation/pages/rating_page.dart';
import 'package:antria_mobile_pelanggan/features/presentation/pages/sign_up_page.dart';
import 'package:antria_mobile_pelanggan/features/presentation/pages/splash_page.dart';
import 'package:antria_mobile_pelanggan/features/presentation/pages/success_order.dart';
import 'package:antria_mobile_pelanggan/features/presentation/pages/taking_queue.dart';
import 'package:antria_mobile_pelanggan/features/presentation/pages/thanks_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoutes(RouteSettings settings) {
    // Corrected return type
    switch (settings.name) {
      case '/':
        return _materialRoute(SplashPage());

      case '/sign-up':
        return _materialRoute(const SignUpPage());

      case '/splash-page':
        return _materialRoute(SplashPage());

      case '/home-page':
        return _materialRoute(const HomePage());

      case '/queue-page':
        return _materialRoute(const QueuePage());

      case '/detail-order-page':
        return _materialRoute(const DetailOrderPage());

      case '/chat-page':
        return _materialRoute(const ChatPage());

      case '/history-page':
        return _materialRoute(const HistoryPage());

      case '/taking-queue-page':
        return _materialRoute(const TakingQueuePage());

      case '/information-restoran':
        return _materialRoute(const InfoRestaurantPage());

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
