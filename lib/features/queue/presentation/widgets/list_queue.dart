import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/features/queue/data/models/queue_list_model.dart';
import 'package:antria_mobile_pelanggan/features/queue/presentation/widgets/queue_customer_card.dart';
import 'package:flutter/material.dart';

class ListQueue extends StatelessWidget {
  final List<QueueListModel> queue;
  const ListQueue({super.key, required this.queue});

  @override
  Widget build(BuildContext context) {
    List<QueueListModel> filteredList = queue
        .where(
          (antrianList) =>
              antrianList.detailTransactionModel!.antrian != null &&
              antrianList.detailTransactionModel!.antrian!.orderstatus ==
                  'PROCESS',
        )
        .toList();
    return Container(
      margin: const EdgeInsets.only(
        top: 28,
      ),
      width: double.infinity,
      height: 488,
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
          bottom: 140,
        ),
        itemCount: filteredList.length,
        itemBuilder: (BuildContext context, int index) {
          final queueList = filteredList[index];
          return Column(
            children: [
              QueueCustomerCard(
                name: queueList.detailTransactionModel!.pelanggan!.nama!,
                imageUrl: queueList
                    .detailTransactionModel!.pelanggan!.profilePicture!,
                number: queueList.id!,
              ),
            ],
          );
        },
      ),
    );
  }
}
