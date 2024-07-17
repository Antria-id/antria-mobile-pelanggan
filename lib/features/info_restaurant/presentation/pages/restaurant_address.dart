import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:html/parser.dart'; // Import for HTML parsing

class RestaurantAddress extends StatefulWidget {
  final String linkGmaps;
  const RestaurantAddress({super.key, required this.linkGmaps});

  @override
  State<RestaurantAddress> createState() => _RestaurantAddressState();
}

class _RestaurantAddressState extends State<RestaurantAddress> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse(_extractMapUrl(widget.linkGmaps)),
      );
    print(widget.linkGmaps);
  }

  String _convertToGoogleMapsUrl(String iframeSrc) {
    final RegExp regex = RegExp(r'!2d([-\d.]+)!3d([-\d.]+)');
    final Match? match = regex.firstMatch(iframeSrc);
    if (match != null) {
      final String latitude = match.group(2)!;
      final String longitude = match.group(1)!;
      return 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    }
    return '';
  }

  String _extractMapUrl(String iframeString) {
    var document = parse(iframeString);
    var iframe = document.querySelector('iframe');
    if (iframe != null) {
      final src = iframe.attributes['src'] ?? '';
      return _convertToGoogleMapsUrl(src);
    }
    return '';
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
          decoration: BoxDecoration(
            color: primaryColor,
          ),
        ),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
