import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/ewallet/data/models/update_ewallet_model.dart';
import 'package:antria_mobile_pelanggan/features/ewallet/domain/repositories/ewallet_repository.dart';
import 'package:antria_mobile_pelanggan/features/ewallet/domain/usecases/ewallet_usecase.dart';
import 'package:antria_mobile_pelanggan/features/profile/data/models/pelanggan_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mocks
class MockEwalletRepository extends Mock implements EwalletRepository {}

void main() {
  late EwalletUsecase ewalletUsecase;
  late MockEwalletRepository mockEwalletRepository;

  setUp(() {
    mockEwalletRepository = MockEwalletRepository();
    ewalletUsecase = EwalletUsecase();

    // Register the mock
    serviceLocator
        .registerFactory<EwalletRepository>(() => mockEwalletRepository);
  });

  tearDown(() {
    serviceLocator.reset();
  });

  group('EwalletUsecase', () {
    final tUpdateEwallet = UpdateEwalletModel(wallet: 100);
    final tPelangganModel = PelangganModel();
    final tFailure =
        ParsingFailure(''); // Adjust according to your Failure class

    test('should return PelangganModel when addWallet is successful', () async {
      // Given
      when(() => mockEwalletRepository.addWallet(updateEwallet: tUpdateEwallet))
          .thenAnswer((_) async => Right(tPelangganModel));

      // When
      final result = await ewalletUsecase.addWallet(tUpdateEwallet);

      // Then
      expect(result, Right(tPelangganModel));
      verify(() =>
              mockEwalletRepository.addWallet(updateEwallet: tUpdateEwallet))
          .called(1);
    });

    test('should return Failure when addWallet fails', () async {
      // Given
      when(() => mockEwalletRepository.addWallet(updateEwallet: tUpdateEwallet))
          .thenAnswer((_) async => Left(tFailure));

      // When
      final result = await ewalletUsecase.addWallet(tUpdateEwallet);

      // Then
      expect(result, Left(tFailure));
      verify(() =>
              mockEwalletRepository.addWallet(updateEwallet: tUpdateEwallet))
          .called(1);
    });
  });
}
