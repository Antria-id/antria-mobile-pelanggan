import 'package:antria_mobile_pelanggan/core/network/network_checker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDataConnectionChecker extends Mock
    implements InternetConnectionChecker {}

void main() {
  late NetworkCheckerImpl networkInfo;
  late MockDataConnectionChecker mockDataConnectionChecker;

  setUp(() {
    mockDataConnectionChecker = MockDataConnectionChecker();
    networkInfo = NetworkCheckerImpl(mockDataConnectionChecker);
  });

  group('isConnected', () {
    test(
      'should forward the call to DataConnectionChecker.hasConnection',
      () async {
        // arrange
        when(() => mockDataConnectionChecker.hasConnection)
            .thenAnswer((_) async {
          return Future.value(true);
        });

        // act
        final tHasConnectionFuture =
            await mockDataConnectionChecker.hasConnection;
        final result = await networkInfo.isConnected;

        // assert
        verify(() => mockDataConnectionChecker.hasConnection);
        expect(result, tHasConnectionFuture);
      },
    );
  });
}
