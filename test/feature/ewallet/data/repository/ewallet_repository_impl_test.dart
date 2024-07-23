import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/ewallet/data/datasources/ewallet_remote_datasource.dart';
import 'package:antria_mobile_pelanggan/features/ewallet/data/models/update_ewallet_model.dart';
import 'package:antria_mobile_pelanggan/features/ewallet/data/repositories/ewallet_repository_impl.dart';
import 'package:antria_mobile_pelanggan/features/profile/data/models/pelanggan_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mocks
class MockEwalletRemoteDatasource extends Mock
    implements EwalletRemoteDatasource {}

void main() {
  late EwalletRepositoryImpl ewalletRepository;
  late MockEwalletRemoteDatasource mockEwalletRemoteDatasource;

  setUpAll(() {
    mockEwalletRemoteDatasource = MockEwalletRemoteDatasource();
    ewalletRepository = EwalletRepositoryImpl();
    // Register the mock
    serviceLocator.registerFactory<EwalletRemoteDatasource>(
        () => mockEwalletRemoteDatasource);
  });

  tearDownAll(() async {
    await serviceLocator.reset(dispose: true);
  });
  group('EwalletRepositoryImpl', () {
    final tUpdateEwallet = UpdateEwalletModel(wallet: 100);
    final tPelangganModel = PelangganModel();

    test('should return PelangganModel when addWallet is successful', () async {
      // Given
      when(() => mockEwalletRemoteDatasource.addWallet(
              updateEwallet: tUpdateEwallet))
          .thenAnswer((_) async => Right(tPelangganModel));

      // When
      final result =
          await ewalletRepository.addWallet(updateEwallet: tUpdateEwallet);

      // Then
      expect(result, Right(tPelangganModel));
      verify(() => mockEwalletRemoteDatasource.addWallet(
          updateEwallet: tUpdateEwallet)).called(1);
    });

    test('should return Failure when addWallet fails', () async {
      // Given
      final tFailure = ParsingFailure(
          ''); // Assuming you have a default constructor or a way to instantiate it
      when(() => mockEwalletRemoteDatasource.addWallet(
              updateEwallet: tUpdateEwallet))
          .thenAnswer((_) async => Left(tFailure));

      // When
      final result =
          await ewalletRepository.addWallet(updateEwallet: tUpdateEwallet);

      // Then
      expect(result, Left(tFailure));
      verify(() => mockEwalletRemoteDatasource.addWallet(
          updateEwallet: tUpdateEwallet)).called(1);
    });
  });
}
