import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/features/profile/data/repositories/pelanggan_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:antria_mobile_pelanggan/features/profile/data/models/pelanggan_model.dart';
import 'package:antria_mobile_pelanggan/features/profile/data/models/update_pelanggan_request_model.dart';
import 'package:dartz/dartz.dart';

class MockProfileUserDatasource extends Mock implements ProfileUserDatasource {}

void main() {
  late ProfileRepositoryImpl repository;
  late MockProfileUserDatasource mockDatasource;

  setUpAll(() {
    mockDatasource = MockProfileUserDatasource();
    serviceLocator.registerSingleton<ProfileUserDatasource>(mockDatasource);
    repository = ProfileRepositoryImpl();
  });

  tearDownAll(() async {
    await serviceLocator.reset(dispose: true);
  });
  group('deleteUserFromLocalStorage', () {
    test('should return void on successful deletion', () async {
      // arrange
      when(() => mockDatasource.deleteUserFromLocalStorage())
          .thenAnswer((_) async => Right(unit));

      // act
      final result = await repository.deleteUserFromLocalStorage();

      // assert
      verify(() => mockDatasource.deleteUserFromLocalStorage());
      expect(result, equals(Right(unit)));
    });

    test('should return Failure on error', () async {
      // arrange
      when(() => mockDatasource.deleteUserFromLocalStorage())
          .thenAnswer((_) async => Left(ConnectionFailure('')));

      // act
      final result = await repository.deleteUserFromLocalStorage();

      // assert
      verify(() => mockDatasource.deleteUserFromLocalStorage());
      expect(result, equals(Left(ConnectionFailure(''))));
    });
  });

  group('getPelanggan', () {
    final pelangganModel = PelangganModel(
      id: 2,
      username: 'rovino',
      password: '2b10Z022U4PS5NksQXTkiVXVOjtDbBtVUGqI3vWK0LpebezqgoQL0si',
      email: 'rovino@verni.yt',
      emailVerified: false,
      profilePicture: 'fea86402-094c-42c2-b791-149ae02cf5c9.jpg',
      nama: 'rovinos',
      handphone: '',
      alamat: '',
      wallet: 2025000,
      createdAt: DateTime.parse('2024-05-01T10:35:07.243Z'),
      updatedAt: DateTime.parse('2024-07-21T14:52:52.965Z'),
    );

    test('should return PelangganModel on success', () async {
      // arrange
      when(() => mockDatasource.getPelanggan())
          .thenAnswer((_) async => Right(pelangganModel));

      // act
      final result = await repository.getPelanggan();

      // assert
      verify(() => mockDatasource.getPelanggan());
      expect(result, equals(Right(pelangganModel)));
    });

    test('should return Failure on error', () async {
      // arrange
      when(() => mockDatasource.getPelanggan())
          .thenAnswer((_) async => Left(ConnectionFailure('')));

      // act
      final result = await repository.getPelanggan();

      // assert
      verify(() => mockDatasource.getPelanggan());
      expect(result, equals(Left(ConnectionFailure(''))));
    });
  });

  group('updatePelanggan', () {
    final updateRequest = UpdatePelangganRequestModel(
      username: 'rovino',
      email: 'rovino@verni.yt',
      profilePicture: 'fea86402-094c-42c2-b791-149ae02cf5c9.jpg',
      nama: "rovinos",
      handphone: "0432423423",
      alamat: "alamat122",
    );
    final updatedPelangganModel = PelangganModel(
      id: 2,
      username: 'rovino',
      password: '2b10Z022U4PS5NksQXTkiVXVOjtDbBtVUGqI3vWK0LpebezqgoQL0si',
      email: 'rovino@verni.yt',
      emailVerified: false,
      profilePicture: 'fea86402-094c-42c2-b791-149ae02cf5c9.jpg',
      nama: 'rovinos',
      handphone: '',
      alamat: '',
      wallet: 2025000,
      createdAt: DateTime.parse('2024-05-01T10:35:07.243Z'),
      updatedAt: DateTime.parse('2024-07-21T14:52:52.965Z'),
    );

    test('should return updated PelangganModel on success', () async {
      // arrange
      when(() => mockDatasource.updatePelanggan(requestModel: updateRequest))
          .thenAnswer((_) async => Right(updatedPelangganModel));

      // act
      final result =
          await repository.updatePelanggan(requestModel: updateRequest);

      // assert
      verify(() => mockDatasource.updatePelanggan(requestModel: updateRequest));
      expect(result, equals(Right(updatedPelangganModel)));
    });

    test('should return Failure on error', () async {
      // arrange
      when(() => mockDatasource.updatePelanggan(requestModel: updateRequest))
          .thenAnswer((_) async => Left(ConnectionFailure('')));

      // act
      final result =
          await repository.updatePelanggan(requestModel: updateRequest);

      // assert
      verify(() => mockDatasource.updatePelanggan(requestModel: updateRequest));
      expect(result, equals(Left(ConnectionFailure(''))));
    });
  });
}
