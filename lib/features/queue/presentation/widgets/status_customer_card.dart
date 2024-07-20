import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/features/queue/presentation/bloc/queue_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatusCustomerCard extends StatelessWidget {
  const StatusCustomerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QueueBloc, QueueState>(
      builder: (context, state) {
        if (state is QueueError) {
          return const Center(
            child: Text('Error'),
          );
        } else if (state is QueueLoaded) {
          String status;
          final orderStatus = state.pesananList.isNotEmpty
              ? state.pesananList.first.orderstatus
              : 'WAITING';

          if (orderStatus == 'WAITING') {
            status = 'Menunggu Konfirmasi Restoran';
          } else if (orderStatus == 'PROCESS') {
            status = 'Menunggu Antrian';
          } else {
            status = 'Status Tidak Diketahui'; // Default status
          }

          return Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  top: 16,
                  bottom: 26,
                ),
              ),
              Container(
                width: 352,
                height: 148,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(10),
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
                      width: 182,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Center(
                          child: Text(
                            status,
                            style: purpleTextStyle.copyWith(
                              fontWeight: semiBold,
                            ),
                            textAlign: TextAlign.center,
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
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
