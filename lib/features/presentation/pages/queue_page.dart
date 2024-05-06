import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/features/presentation/widgets/queue_customer_card.dart';
import 'package:flutter/material.dart';

class QueuePage extends StatelessWidget {
  const QueuePage({super.key});

  Widget header() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 16,
            bottom: 26,
          ),
          child: Text(
            'Antrian Anda',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
        ),
        Container(
          width: 352,
          height: 148,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 14,
                ),
                child: Image.asset(
                  'assets/icons/icon_queue.png',
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Container(
                height: 36,
                width: 182,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                child: Center(
                  child: Text(
                    'Menunggu Antrian',
                    style: purpleTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget information() {
    return Container(
      margin: const EdgeInsets.only(
        top: 46,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  'Posisi Antrian',
                  style: greyTextStyle.copyWith(
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  '18',
                  style: blackTextStyle.copyWith(
                    fontSize: 24,
                    fontWeight: semiBold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 64,
            child: VerticalDivider(
              color: greyColor,
              thickness: 4,
              indent: 8,
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  'Estimasi Waktu',
                  style: greyTextStyle.copyWith(
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  '30 menit',
                  style: blackTextStyle.copyWith(
                    fontSize: 24,
                    fontWeight: semiBold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget customer() {
    List<Map<String, dynamic>> menuItems = [
      {
        'imageUrl': 'assets/images/profile.png',
        'name': 'Zamrun',
        'number': 16,
      },
      {
        'imageUrl': 'assets/images/profile.png',
        'name': 'Haikal',
        'number': 17,
      },
      {
        'imageUrl': 'assets/images/profile.png',
        'name': 'Jeremia',
        'number': 18,
      },
      {
        'imageUrl': 'assets/images/profile.png',
        'name': 'Liu',
        'number': 19,
      },
    ];

    return Container(
      margin: const EdgeInsets.only(
        top: 48,
      ),
      width: double.infinity,
      height: 380,
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(
          0.2,
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(
            10,
          ),
          topRight: Radius.circular(
            10,
          ),
        ),
      ),
      child: ListView.builder(
        itemCount: menuItems.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              QueueCustomerCard(
                name: menuItems[index]['name'],
                imageUrl: menuItems[index]['imageUrl'],
                number: menuItems[index]['number'],
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            header(),
            information(),
            customer(),
          ],
        ),
      ),
    );
  }
}
