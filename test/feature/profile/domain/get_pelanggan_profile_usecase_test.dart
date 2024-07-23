import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/profile/data/models/pelanggan_model.dart';
import 'package:antria_mobile_pelanggan/features/profile/domain/repositories/pelanggan_repository.dart';
import 'package:antria_mobile_pelanggan/features/profile/domain/usecases/get_pelanggan_profile_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Create a mock class for ProfileRepository
class MockProfileRepository extends Mock implements ProfileRepository {}

void main() {
  late GetPelangganProfileUsecase usecase;
  late MockProfileRepository mockProfileRepository;

  setUpAll(() {
    mockProfileRepository = MockProfileRepository();
    serviceLocator.registerSingleton<ProfileRepository>(mockProfileRepository);
    usecase = GetPelangganProfileUsecase();
  });

  tearDownAll(() async {
    await serviceLocator.reset(dispose: true);
  });

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

  test('should get pelanggan profile from the repository', () async {
    // Arrange
    when(() => mockProfileRepository.getPelanggan())
        .thenAnswer((_) async => Right(pelangganModel));

    // Act
    final result = await usecase.getPelanggan();

    // Assert
    expect(result, Right(pelangganModel));
    verify(() => mockProfileRepository.getPelanggan()).called(1);
    verifyNoMoreInteractions(mockProfileRepository);
  });

  test('should return Failure when the call to repository is unsuccessful',
      () async {
    // Arrange
    when(() => mockProfileRepository.getPelanggan())
        .thenAnswer((_) async => Left(ConnectionFailure('')));

    // Act
    final result = await usecase.getPelanggan();

    // Assert
    expect(result, Left(ConnectionFailure('')));
    verify(() => mockProfileRepository.getPelanggan()).called(1);
    verifyNoMoreInteractions(mockProfileRepository);
  });
}
