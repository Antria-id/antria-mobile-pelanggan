import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/features/history/presentation/pages/done_order_page.dart';
import 'package:antria_mobile_pelanggan/features/history/presentation/pages/order_progress_page.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            'Riwayat Pesanan',
            style: whiteTextStyle.copyWith(
              fontSize: 16,
            ),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: primaryColor,
            ),
          ),
          bottom: TabBar(
            labelColor: Colors.white,
            indicatorColor: Colors.white,
            unselectedLabelColor: Colors.white,
            labelStyle: whiteTextStyle.copyWith(
              fontSize: 14,
            ),
            tabs: [
              Tab(
                text: 'Berlangsung',
              ),
              Tab(
                text: 'Selesai',
              )
            ],
          ),
        ),
        backgroundColor: backgroundGreyColor,
        body: const TabBarView(
          children: [
            OrderProgress(),
            DoneOrder(),
          ],
        ),
      ),
    );
  }
}
