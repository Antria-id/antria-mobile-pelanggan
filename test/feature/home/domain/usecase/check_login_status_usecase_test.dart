import 'dart:convert';
import 'package:antria_mobile_pelanggan/features/home/data/models/user/user_response_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:antria_mobile_pelanggan/core/services/user_cache_services.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/home/domain/usecases/home/check_login_status_usecase.dart';

// Define a mock for UserCacheService
class MockUserCacheService extends Mock implements UserCacheService {}

void main() {
  late MockUserCacheService mockUserCacheService;
  late CheckUserLoginStatusImpl checkUserLoginStatusImpl;

  setUp(() {
    mockUserCacheService = MockUserCacheService();
    serviceLocator.registerSingleton<UserCacheService>(mockUserCacheService);
    checkUserLoginStatusImpl = CheckUserLoginStatusImpl();
  });

  tearDown(() {
    serviceLocator.reset();
  });

  test('returns true when user is logged in', () async {
    // Arrange
    final userJson = jsonEncode({
      "sub": 1,
      "username": "testuser",
      "role": "admin",
      "iat": 1234567890,
      "exp": 1234567890,
    });
    final user = userModelFromJson(userJson);
    when(() => mockUserCacheService.getUser())
        .thenAnswer((_) async => Future.value(user));

    // Act
    final result = await checkUserLoginStatusImpl.checkIfUserLoggedIn();

    // Assert
    expect(result, true);
    verify(() => mockUserCacheService.getUser()).called(1);
  });

  test('returns false when user is not logged in', () async {
    // Arrange
    when(() => mockUserCacheService.getUser())
        .thenAnswer((_) async => Future.value(null));

    // Act
    final result = await checkUserLoginStatusImpl.checkIfUserLoggedIn();

    // Assert
    expect(result, false);
    verify(() => mockUserCacheService.getUser()).called(1);
  });
}
