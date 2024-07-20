import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/features/history/presentation/bloc/detail/detail_bloc.dart';
import 'package:antria_mobile_pelanggan/features/queue/data/models/queue_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

class InformationQueue extends StatelessWidget {
  final List<QueueListModel> queue;
  const InformationQueue({super.key, required this.queue});

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
    filteredList.sort((a, b) {
      final createdAtA = a.detailTransactionModel!.antrian!.createdAt!;
      final createdAtB = b.detailTransactionModel!.antrian!.createdAt!;
      return createdAtA.compareTo(createdAtB);
    });

    return BlocBuilder<DetailTransactionBloc, DetailTransactionState>(
      builder: (context, state) {
        if (state is DetailTransactionError) {
          return const Center(
            child: Text('Error'),
          );
        } else if (state is DetailTransactionLoaded) {
          final antrian = state.response.antrian!;
          final createdAt = DateTime.parse(antrian.createdAt!.toString());
          final currentTime = DateTime.now();
          final elapsedTime = currentTime.difference(createdAt).inMinutes;
          final remainingTime = antrian.estimasi! - elapsedTime;

          // Find the queueList in filteredList corresponding to this antrian
          final queueList = filteredList.firstWhere((element) =>
              element.detailTransactionModel!.antrian!.id == antrian.id);

          String nomor =
              (filteredList.indexOf(queueList) + 1).toString().padLeft(2, '0');

          return Row(
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
                      nomor,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TimerCountdown(
                          enableDescriptions: false,
                          timeTextStyle: blackTextStyle.copyWith(
                              fontSize: 24, fontWeight: semiBold),
                          format: CountDownTimerFormat.minutesOnly,
                          endTime: DateTime.now().add(
                            Duration(
                              minutes: remainingTime,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Menit',
                          style: blackTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: semiBold,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
