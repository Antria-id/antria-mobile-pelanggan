import 'package:flutter/material.dart';
import 'package:antria_mobile_pelanggan/config/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      onGenerateRoute: AppRoutes.onGenerateRoutes,
    );
  }
}
