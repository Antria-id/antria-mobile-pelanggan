import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCardWidget extends StatelessWidget {
  final String invoice;
  final String tanggal;
  final int income;
  final String status;
  final VoidCallback onTap;

  const TransactionCardWidget({
    super.key,
    required this.invoice,
    required this.tanggal,
    required this.income,
    required this.onTap,
    required this.status,
  });

  // Helper method to translate status
  String _getStatusText(String status) {
    switch (status) {
      case 'ALLDONE':
        return 'SELESAI';
      case 'WAITING':
        return 'MENUNGGU';
      case 'PROCESS':
        return 'PROSES';
      default:
        return status;
    }
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'ALLDONE':
        return primaryColor;
      case 'WAITING':
        return Color.fromARGB(255, 235, 214, 20);
      case 'PROCESS':
        return Colors.green;
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    String formattedPrice = NumberFormat.currency(
      locale: 'id_ID',
      symbol: '+Rp ',
      decimalDigits: 0,
    ).format(income);

    String translatedStatus = _getStatusText(status);
    Color statusColor = _getStatusColor(status);

    return ExpansionTile(
      tilePadding: const EdgeInsets.symmetric(horizontal: 10),
      collapsedShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      backgroundColor: Colors.white,
      collapsedBackgroundColor: Colors.white,
      title: Container(
        width: double.infinity,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              invoice,
              style: blackTextStyle.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              translatedStatus,
              style: blackTextStyle.copyWith(
                color: statusColor,
              ),
            ),
          ],
        ),
      ),
      trailing: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              tanggal,
              style: blackTextStyle.copyWith(
                fontWeight: bold,
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              formattedPrice,
              style: blackTextStyle.copyWith(
                color: Colors.green,
                fontWeight: bold,
              ),
            ),
          ],
        ),
      ),
      children: [
        Container(
          width: double.infinity,
          height: 40,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            color: greyColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: onTap,
              child: const Center(
                child: Text(
                  'Lihat Detail',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
