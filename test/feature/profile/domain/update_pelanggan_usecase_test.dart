import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/profile/data/models/pelanggan_model.dart';
import 'package:antria_mobile_pelanggan/features/profile/data/models/update_pelanggan_request_model.dart';
import 'package:antria_mobile_pelanggan/features/profile/domain/repositories/pelanggan_repository.dart';
import 'package:antria_mobile_pelanggan/features/profile/domain/usecases/update_pelanggan_usecase.dart';

class MockProfileRepository extends Mock implements ProfileRepository {}

void main() {
  late MockProfileRepository mockProfileRepository;
  late UpdatePelangganUsecase updatePelangganUsecase;

  setUpAll(() {
    registerFallbackValue(UpdatePelangganRequestModel(
      username: '',
      email: '',
      profilePicture: '',
      nama: '',
      handphone: '',
      alamat: '',
    ));
    registerFallbackValue(PelangganModel(
      id: 0,
      username: '',
      password: '',
      email: '',
      emailVerified: false,
      profilePicture: '',
      nama: '',
      handphone: '',
      alamat: '',
      wallet: 0,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ));
  });

  setUp(() {
    mockProfileRepository = MockProfileRepository();

    serviceLocator
        .registerLazySingleton<ProfileRepository>(() => mockProfileRepository);

    updatePelangganUsecase = UpdatePelangganUsecase();
  });

  tearDown(() {
    serviceLocator.reset();
  });

  final tRequestModel = UpdatePelangganRequestModel(
    username: 'rovino',
    email: 'rovino@verni.yt',
    profilePicture: 'fea86402-094c-42c2-b791-149ae02cf5c9.jpg',
    nama: "rovinos",
    handphone: "0432423423",
    alamat: "alamat122",
  );
  final tPelangganModel = PelangganModel(
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

  test('should update pelanggan and return PelangganModel on success',
      () async {
    // Arrange
    when(() => mockProfileRepository.updatePelanggan(
            requestModel: any(named: 'requestModel')))
        .thenAnswer((_) async => Right(tPelangganModel));

    // Act
    final result = await updatePelangganUsecase.updatePelanggan(tRequestModel);

    // Assert
    expect(result, Right(tPelangganModel));
    verify(() =>
            mockProfileRepository.updatePelanggan(requestModel: tRequestModel))
        .called(1);
  });

  test('should return Failure on unsuccessful update', () async {
    // Arrange
    final failure = ConnectionFailure('');
    when(() => mockProfileRepository.updatePelanggan(
            requestModel: any(named: 'requestModel')))
        .thenAnswer((_) async => Left(failure));

    // Act
    final result = await updatePelangganUsecase.updatePelanggan(tRequestModel);

    // Assert
    expect(result, Left(failure));
    verify(() =>
            mockProfileRepository.updatePelanggan(requestModel: tRequestModel))
        .called(1);
  });
}
