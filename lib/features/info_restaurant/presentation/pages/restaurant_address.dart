import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RestaurantAddress extends StatefulWidget {
  final String? linkGmaps;
  const RestaurantAddress({super.key, required this.linkGmaps});

  @override
  State<RestaurantAddress> createState() => _RestaurantAddressState();
}

class _RestaurantAddressState extends State<RestaurantAddress> {
  WebViewController? controller;

  @override
  void initState() {
    super.initState();
    if (widget.linkGmaps != null && widget.linkGmaps!.isNotEmpty) {
      controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..loadRequest(
          Uri.parse(widget.linkGmaps!),
        );
    }
  }

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
          decoration: const BoxDecoration(
            color: primaryColor,
          ),
        ),
      ),
      body: (widget.linkGmaps != null && widget.linkGmaps!.isNotEmpty)
          ? WebViewWidget(controller: controller!)
          : Center(
              child: Text(
                'Peta belum tersedia',
                style: blackTextStyle.copyWith(
                  fontWeight: bold,
                  fontSize: 18,
                ),
              ),
            ),
    );
  }
}
