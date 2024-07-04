import 'dart:async';
import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/features/queue/presentation/widgets/queue_customer_card.dart';
import 'package:antria_mobile_pelanggan/features/queue/presentation/widgets/status_customer_card.dart';
import 'package:flutter/material.dart';

class QueuePage extends StatefulWidget {
  const QueuePage({super.key});

  @override
  _QueuePageState createState() => _QueuePageState();
}

class _QueuePageState extends State<QueuePage> {
  late Timer _timer;
  Duration _duration = const Duration(minutes: 30);

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_duration.inSeconds == 0) {
        timer.cancel();
      } else {
        setState(() {
          _duration = Duration(seconds: _duration.inSeconds - 1);
        });
      }
    });
  }

  String get formattedTime {
    String minutes =
        _duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    String seconds =
        _duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
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
                  formattedTime,
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

  Widget customer(BuildContext context) {
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
        bottom: 90,
      ),
      width: double.infinity,
      height: 398,
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
        padding: const EdgeInsets.only(
          bottom: 80,
        ),
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
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 0,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const StatusCustomerCard(),
            information(),
            customer(context),
          ],
        ),
      ),
    );
  }
}
