import 'package:test/test.dart';
import 'package:todo_flutter_sample/helpers/filter.dart';

void main() {
  group('Filter', () {
    group('.truncate', () {
      test('when value length is under 20', () {
        final actual = Filter.truncate('aaaaaaaaaaaaaaaaaaaa');
        expect(actual, equals('aaaaaaaaaaaaaaaaaaaa'));
      });

      test('when value length is over 20', () {
        final actual = Filter.truncate('aaaaaaaaaaaaaaaaaaaaa');
        expect(actual, equals('aaaaaaaaaaaaaaaaa...'));
      });

      test('when arg length is 10', () {
        final actual = Filter.truncate('aaaaaaaaaaaaaaaaaaaa', length: 10);
        expect(actual, equals('aaaaaaa...'));
      });
    });
  });

  group('.truncate', () {
    test('when dateTime is null', () {
      final actual = Filter.datetime(null);
      expect(actual, equals(''));
    });

    test('when dateTime is 2020-08-01 12:00', () {
      final dateTime = DateTime.parse('2020-08-01 12:00');
      final actual = Filter.datetime(dateTime);
      expect(actual, equals('2020/08/01 12:00:00'));
    });
  });
}
