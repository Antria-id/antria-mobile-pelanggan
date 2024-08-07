import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:antria_mobile_pelanggan/features/ewallet/presentation/bloc/ewallet_bloc.dart';
import 'package:antria_mobile_pelanggan/features/history/presentation/bloc/detail/detail_bloc.dart';
import 'package:antria_mobile_pelanggan/features/history/presentation/bloc/history/history_bloc.dart';
import 'package:antria_mobile_pelanggan/features/history/presentation/bloc/order_progress/order_bloc.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/presentation/bloc/info_restaurant/info_restaurant_bloc.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/presentation/bloc/menu/menu_bloc.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/presentation/bloc/orderlist/order_list_bloc.dart';
import 'package:antria_mobile_pelanggan/features/profile/presentation/bloc/pelanggan_profile/pelanggan_profile_bloc.dart';
import 'package:antria_mobile_pelanggan/features/profile/presentation/bloc/update_profile/update_pelanggan_bloc.dart';
import 'package:antria_mobile_pelanggan/features/queue/presentation/bloc/queue_bloc.dart';
import 'package:antria_mobile_pelanggan/features/rating/presentation/bloc/reviews/reviews_bloc.dart';
import 'package:flutter/material.dart';
import 'package:antria_mobile_pelanggan/config/routes/routes.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/home/presentation/bloc/get_restaurant/get_restaurant_bloc.dart';
import 'features/home/presentation/bloc/user/user_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  await setUpServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthBloc()),
        BlocProvider(create: (_) => GetRestaurantBloc()),
        BlocProvider(create: (_) => UserBloc()),
        BlocProvider(create: (_) => InfoRestaurantBloc()),
        BlocProvider(create: (_) => MenuBloc()),
        BlocProvider(create: (_) => PelangganProfileBloc()),
        BlocProvider(create: (_) => UpdatePelangganBloc()),
        BlocProvider(create: (_) => ReviewsBloc()),
        BlocProvider(create: (_) => OrderListBloc()),
        BlocProvider(create: (_) => HistoryTransactionBloc()),
        BlocProvider(create: (_) => DetailTransactionBloc()),
        BlocProvider(create: (_) => OrderTransactionBloc()),
        BlocProvider(create: (_) => QueueBloc()),
        BlocProvider(create: (_) => EwalletBloc()),
      ],
      child: const MaterialApp(
        title: 'Antria',
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
