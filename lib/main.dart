import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/presentation/bloc/info_restaurant/info_restaurant_bloc.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/presentation/bloc/menu_restaurant/menu_restaurant_bloc.dart';
import 'package:antria_mobile_pelanggan/features/profile/presentation/bloc/logout/logout_bloc.dart';
import 'package:antria_mobile_pelanggan/features/profile/presentation/bloc/pelanggan_profile/pelanggan_profile_bloc.dart';
import 'package:antria_mobile_pelanggan/features/profile/presentation/bloc/update_profile/update_pelanggan_bloc.dart';
import 'package:antria_mobile_pelanggan/features/rating/presentation/bloc/reviews/reviews_bloc.dart';
import 'package:flutter/material.dart';
import 'package:antria_mobile_pelanggan/config/routes/routes.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/auth/presentation/bloc/login/login_bloc.dart';
import 'features/home/presentation/bloc/get_restaurant/get_restaurant_bloc.dart';
import 'features/auth/presentation/bloc/register/register_bloc.dart';
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
        BlocProvider(create: (_) => LoginBloc()),
        BlocProvider(create: (_) => RegisterBloc()),
        BlocProvider(create: (_) => GetRestaurantBloc()),
        BlocProvider(create: (_) => UserBloc()),
        BlocProvider(create: (_) => InfoRestaurantBloc()),
        BlocProvider(create: (_) => MenuRestaurantBloc()),
        BlocProvider(create: (_) => PelangganProfileBloc()),
        BlocProvider(create: (_) => LogoutBloc()),
        BlocProvider(create: (_) => UpdatePelangganBloc()),
        BlocProvider(create: (_) => ReviewsBloc()),
      ],
      child: const MaterialApp(
        onGenerateRoute: AppRoutes.onGenerateRoutes,
      ),
    );
  }
}
