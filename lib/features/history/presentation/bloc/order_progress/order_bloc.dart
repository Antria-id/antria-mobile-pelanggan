import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/history/data/models/order_progress/order_transaction_response.dart';
import 'package:antria_mobile_pelanggan/features/history/domain/usecases/order_progress/get_order_transaction_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderTransactionBloc
    extends Bloc<OrderTransactionEvent, OrderTransactionState> {
  OrderTransactionBloc() : super(OrderTransactionInitial()) {
    on<OrderTransactionEvent>((event, emit) async {
      if (event is OrderTransactionFetchData) {
        var result = await serviceLocator<GetOrderTransactionUsecase>()
            .getProgressOrder();
        result.fold(
          (failure) {
            emit(OrderTransactionError(message: failure.message));
          },
          (data) {
            emit(
              OrderTransactionLoaded(
                transactionList: data,
              ),
            );
          },
        );
      }
    });
  }
}
