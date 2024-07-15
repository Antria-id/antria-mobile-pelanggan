import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RestaurantAddress extends StatefulWidget {
  const RestaurantAddress({super.key});

  @override
  State<RestaurantAddress> createState() => _RestaurantAddressState();
}

class _RestaurantAddressState extends State<RestaurantAddress> {
  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(
      Uri.parse('https://pub.dev/packages/webview_flutter/versions'),
    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundGreyColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Peta Restoran',
          style: whiteTextStyle.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: whiteColor,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: primaryColor,
          ),
        ),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
