import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/presentation/bloc/login/login_bloc.dart';
import 'package:antria_mobile_pelanggan/features/presentation/bloc/register/bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:antria_mobile_pelanggan/config/routes/routes.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      ],
      child: const MaterialApp(
        onGenerateRoute: AppRoutes.onGenerateRoutes,
      ),
    );
  }
}
