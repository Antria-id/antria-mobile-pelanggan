import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/features/profile/presentation/widgets/card_contact_support_widget.dart';
import 'package:antria_mobile_pelanggan/shared/custom_appbar.dart';
import 'package:flutter/material.dart';

class ContactSupportPage extends StatelessWidget {
  const ContactSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: 'Contact Support',
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
      backgroundColor: backgroundGreyColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            CardContactSupportWidget(
              icon: 'assets/icons/whatsapp.png',
              label: 'Whatsapp',
              link: 'https://wa.me/qr/XDO2145111',
              onTap: () {},
            ),
            const SizedBox(
              height: 20,
            ),
            CardContactSupportWidget(
              icon: 'assets/icons/gmail.png',
              label: 'Gmail',
              link: 'antria.id@gmail.com',
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
