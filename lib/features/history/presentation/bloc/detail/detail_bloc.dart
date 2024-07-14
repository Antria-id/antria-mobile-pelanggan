import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/history/data/models/done_order/detail_transaction_model.dart';
import 'package:antria_mobile_pelanggan/features/history/domain/usecases/done_order/get_detail_transaction_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailTransactionBloc
    extends Bloc<DetailTransactionEvent, DetailTransactionState> {
  DetailTransactionBloc() : super(DetailTransactionInitial()) {
    on<DetailTransactionEvent>((event, emit) async {
      if (event is DetailTransactionFetchData) {
        var result = await serviceLocator<GetDetailTransactionUsecase>()
            .getDetailOrder(invoice: event.invoice);
        result.fold(
          (failure) {
            emit(DetailTransactionError(message: failure.message));
          },
          (data) {
            emit(DetailTransactionLoaded(response: data));
          },
        );
      }
    });
  }
}
