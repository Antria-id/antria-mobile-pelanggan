import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/queue/data/models/queue_list_model.dart';
import 'package:antria_mobile_pelanggan/features/queue/domain/usecases/get_queue_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'queue_event.dart';
part 'queue_state.dart';

class QueueBloc extends Bloc<QueueEvent, QueueState> {
  QueueBloc() : super(QueueInitial()) {
    on<QueueEvent>((event, emit) async {
      if (event is QueueFetchData) {
        emit(QueueLoading());
        var result = await serviceLocator<GetQueueUsecase>()
            .getQueue(mitraId: event.mitraId);
        result.fold(
          (failure) {
            emit(QueueError(message: failure.message));
          },
          (data) {
            emit(
              QueueLoaded(
                pesananList: data,
              ),
            );
          },
        );
      }
    });
  }
}
