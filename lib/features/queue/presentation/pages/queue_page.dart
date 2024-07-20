import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/features/history/presentation/bloc/detail/detail_bloc.dart';
import 'package:antria_mobile_pelanggan/features/queue/presentation/bloc/queue_bloc.dart';
import 'package:antria_mobile_pelanggan/features/queue/presentation/widgets/list_queue.dart';
import 'package:antria_mobile_pelanggan/features/queue/presentation/widgets/status_customer_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

class QueuePage extends StatefulWidget {
  final int mitraId;
  final String invoice;

  const QueuePage({
    super.key,
    required this.mitraId,
    required this.invoice,
  });

  @override
  _QueuePageState createState() => _QueuePageState();
}

class _QueuePageState extends State<QueuePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<DetailTransactionBloc>(context)
        .add(DetailTransactionFetchData(invoice: widget.invoice));
  }

  void navigateToRatingPage() {
    Navigator.pushNamed(
      context,
      '/success-order-page',
      arguments: widget.mitraId,
    );
  }

  Widget information() {
    return BlocBuilder<DetailTransactionBloc, DetailTransactionState>(
      builder: (context, state) {
        if (state is DetailTransactionError) {
          return Center(
            child: Text('Error'),
          );
        } else if (state is DetailTransactionLoaded) {
          final antrian = state.response.antrian!;
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
                      antrian.id!.toString(),
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
                              minutes: antrian.estimasi!,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.popUntil(context, (route) => route.isFirst);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: whiteColor,
          ),
        ),
        title: Text(
          'Antrian Anda',
          style: whiteTextStyle.copyWith(fontWeight: bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                QueueBloc()..add(QueueFetchData(widget.mitraId)),
          ),
          BlocProvider(
            create: (context) => DetailTransactionBloc()
              ..add(DetailTransactionFetchData(invoice: widget.invoice)),
          ),
        ],
        child: SafeArea(
          child: BlocBuilder<QueueBloc, QueueState>(
            builder: (context, state) {
              if (state is QueueError) {
                return Center(
                  child: Text('Error'),
                );
              } else if (state is QueueLoaded) {
                final orderStatus = state.pesananList.isNotEmpty
                    ? state.pesananList.first.orderstatus
                    : 'WAITING';
                if (orderStatus == 'ALLDONE') {
                  Future.microtask(() => navigateToRatingPage());
                }

                return SingleChildScrollView(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      await Future.delayed(
                        Duration(milliseconds: 200),
                      );
                      BlocProvider.of<QueueBloc>(context).add(
                        QueueFetchData(widget.mitraId),
                      );
                      BlocProvider.of<DetailTransactionBloc>(context).add(
                        DetailTransactionFetchData(invoice: widget.invoice),
                      );
                    },
                    child: Column(
                      children: [
                        const StatusCustomerCard(),
                        SizedBox(
                          height: 20,
                        ),
                        if (orderStatus == 'PROCESS') information(),
                        ListQueue(queue: state.pesananList),
                      ],
                    ),
                  ),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
