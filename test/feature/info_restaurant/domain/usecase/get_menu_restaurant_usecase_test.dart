import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/data/models/get_menu_model.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/domain/repositories/menu_restaurant_repository.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/domain/usecases/menu_restaurant/get_menu_restaurant_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Create a Mock class for MenuRestaurantRepository
class MockMenuRestaurantRepository extends Mock
    implements MenuRestaurantRepository {}

void main() {
  late GetMenuUsecase getMenuUsecase;
  late MockMenuRestaurantRepository mockMenuRestaurantRepository;

  setUp(() {
    mockMenuRestaurantRepository = MockMenuRestaurantRepository();
    getMenuUsecase = GetMenuUsecase();

    // Register the mock repository with the service locator
    serviceLocator.registerLazySingleton<MenuRestaurantRepository>(
        () => mockMenuRestaurantRepository);
  });

  tearDown(() {
    serviceLocator.reset();
  });

  final int testMitraId = 1;
  final List<GetMenuResponse> testMenuResponse = [
    GetMenuResponse(
        // Initialize with appropriate test data
        ),
  ];

  test('should return menu data when the call to repository is successful',
      () async {
    // arrange
    when(() => mockMenuRestaurantRepository.getMenuRestaurant(any()))
        .thenAnswer((_) async => Right(testMenuResponse));

    // act
    final result = await getMenuUsecase.getMenuRestaurant(testMitraId);

    // assert
    expect(result, Right(testMenuResponse));
    verify(() => mockMenuRestaurantRepository.getMenuRestaurant(testMitraId))
        .called(1);
    verifyNoMoreInteractions(mockMenuRestaurantRepository);
  });

  test('should return a Failure when the call to repository is unsuccessful',
      () async {
    // arrange
    final failure = ConnectionFailure('Connection Failure');
    when(() => mockMenuRestaurantRepository.getMenuRestaurant(any()))
        .thenAnswer((_) async => Left(failure));

    // act
    final result = await getMenuUsecase.getMenuRestaurant(testMitraId);

    // assert
    expect(result, Left(failure));
    verify(() => mockMenuRestaurantRepository.getMenuRestaurant(testMitraId))
        .called(1);
    verifyNoMoreInteractions(mockMenuRestaurantRepository);
  });
}
