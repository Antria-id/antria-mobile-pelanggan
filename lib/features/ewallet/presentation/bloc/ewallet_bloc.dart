import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/ewallet/data/models/update_ewallet_model.dart';
import 'package:antria_mobile_pelanggan/features/ewallet/domain/usecases/ewallet_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'ewallet_event.dart';
part 'ewallet_state.dart';

class EwalletBloc extends Bloc<EwalletEvent, EwalletState> {
  EwalletBloc() : super(EwalletInitial()) {
    on<EwalletEvent>((event, emit) async {
      if (event is UpdateEwalletTapped) {
        final user = event.updateEwallet;
        emit(EwalletLoading());
        var result = await serviceLocator<EwalletUsecase>().addWallet(user);
        result.fold(
          (failure) {
            emit(EwalletError(failure.message));
          },
          (data) {
            emit(
              EwalletSuccess(updateEwallet: user),
            );
          },
        );
      }
    });
  }
}
