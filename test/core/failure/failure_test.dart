import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Failure Classes', () {
    const String testMessage = 'Test failure message';

    test('Exception should be instantiated with the correct message', () {
      const failure = Exception(testMessage);
      expect(failure.message, testMessage);
    });

    test(
        'LocalDatabaseQueryFailure should be instantiated with the correct message',
        () {
      const failure = LocalDatabaseQueryFailure(testMessage);
      expect(failure.message, testMessage);
    });

    test('ConnectionFailure should be instantiated with the correct message',
        () {
      const failure = ConnectionFailure(testMessage);
      expect(failure.message, testMessage);
    });

    test('ParsingFailure should be instantiated with the correct message', () {
      const failure = ParsingFailure(testMessage);
      expect(failure.message, testMessage);
    });

    test('Failures with same message should be equal', () {
      const failure1 = Exception(testMessage);
      const failure2 = Exception(testMessage);

      expect(failure1, failure2);
      expect(failure1.hashCode, failure2.hashCode);
    });

    test('Failures with different messages should not be equal', () {
      const failure1 = Exception('Message 1');
      const failure2 = Exception('Message 2');

      expect(failure1, isNot(failure2));
      expect(failure1.hashCode, isNot(failure2.hashCode));
    });

    test('Different Failure types with the same message should not be equal',
        () {
      const failure1 = Exception(testMessage);
      const failure2 = ConnectionFailure(testMessage);

      expect(failure1, isNot(failure2));
      expect(failure1.hashCode, isNot(failure2.hashCode));
    });
  });
}
