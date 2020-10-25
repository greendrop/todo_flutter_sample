import 'package:test/test.dart';
import 'package:todo_flutter_sample/models/oauth2_token.dart';
import 'package:todo_flutter_sample/models/user.dart';

void main() {
  group('OAuth2Token', () {
    group('#isValidToken', () {
      test('when exists accessToken and expiresAt until now', () {
        final oauth2Token = OAuth2Token(
            accessToken: 'access_token',
            expiresAt: DateTime.now().add(const Duration(minutes: 1)));
        final actual = oauth2Token.isValidToken();
        expect(actual, equals(true));
      });

      test('when accessToken is null', () {
        final oauth2Token = OAuth2Token(accessToken: null);
        final actual = oauth2Token.isValidToken();
        expect(actual, equals(false));
      });

      test('when accessToken is blank', () {
        final oauth2Token = OAuth2Token(accessToken: '');
        final actual = oauth2Token.isValidToken();
        expect(actual, equals(false));
      });

      test('when expiresAt is null', () {
        final oauth2Token =
            OAuth2Token(accessToken: 'access_token', expiresAt: null);
        final actual = oauth2Token.isValidToken();
        expect(actual, equals(false));
      });

      test('when expiresAt before now', () {
        final oauth2Token = OAuth2Token(
            accessToken: 'access_token',
            expiresAt: DateTime.now().add(const Duration(minutes: -1)));
        final actual = oauth2Token.isValidToken();
        expect(actual, equals(false));
      });
    });

    group('#isSignedIn', () {
      test('when isValidToken is true and user.id is 1', () {
        final oauth2Token = OAuth2Token(
            accessToken: 'access_token',
            expiresAt: DateTime.now().add(const Duration(minutes: 1)));
        final user = User(id: 1);
        final actual = oauth2Token.isSignedIn(user);
        expect(actual, equals(true));
      });

      test('when isValidToken is false', () {
        final oauth2Token = OAuth2Token(accessToken: '');
        final user = User(id: 1);
        final actual = oauth2Token.isSignedIn(user);
        expect(actual, equals(false));
      });

      test('when isValidToken is true and user.id is 0', () {
        final oauth2Token = OAuth2Token(
            accessToken: 'access_token',
            expiresAt: DateTime.now().add(const Duration(minutes: 1)));
        final user = User(id: 0);
        final actual = oauth2Token.isSignedIn(user);
        expect(actual, equals(false));
      });

      test('when isValidToken is true and user is null', () {
        final oauth2Token = OAuth2Token(
            accessToken: 'access_token',
            expiresAt: DateTime.now().add(const Duration(minutes: 1)));
        final actual = oauth2Token.isSignedIn(null);
        expect(actual, equals(false));
      });
    });

    group('#isNeedRefresh', () {
      test('when exists refreshToken and expiresAt is before 59min', () {
        final oauth2Token = OAuth2Token(
            refreshToken: 'refresh_token',
            expiresAt: DateTime.now().add(const Duration(minutes: -59)));
        final actual = oauth2Token.isNeedRefresh();
        expect(actual, equals(true));
      });

      test('when refreshToken is null', () {
        final oauth2Token = OAuth2Token(
            refreshToken: null,
            expiresAt: DateTime.now().add(const Duration(minutes: -59)));
        final actual = oauth2Token.isNeedRefresh();
        expect(actual, equals(false));
      });

      test('when refreshToken is blank', () {
        final oauth2Token = OAuth2Token(
            refreshToken: '',
            expiresAt: DateTime.now().add(const Duration(minutes: -59)));
        final actual = oauth2Token.isNeedRefresh();
        expect(actual, equals(false));
      });

      test('when exists refreshToken and expiresAt is before 1hour 1min', () {
        final oauth2Token = OAuth2Token(
            refreshToken: 'refresh_token',
            expiresAt:
                DateTime.now().add(const Duration(hours: -1, minutes: -1)));
        final actual = oauth2Token.isNeedRefresh();
        expect(actual, equals(false));
      });
    });
  });
}
