import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/history/data/models/done_order/history_transaction_response.dart';
import 'package:antria_mobile_pelanggan/features/history/domain/usecases/done_order/get_history_transaction_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryTransactionBloc
    extends Bloc<HistoryTransactionEvent, HistoryTransactionState> {
  HistoryTransactionBloc() : super(HistoryTransactionInitial()) {
    on<HistoryTransactionEvent>((event, emit) async {
      if (event is HistoryTransactionFetchData) {
        var result = await serviceLocator<GetHistoryTransactionUsecase>()
            .getHistoryOrder();
        result.fold(
          (failure) {
            emit(HistoryTransactionError(message: failure.message));
          },
          (data) {
            emit(
              HistoryTransactionLoaded(
                transactionList: data,
              ),
            );
          },
        );
      }
    });
  }
}
