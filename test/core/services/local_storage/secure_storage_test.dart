import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/mocks.dart';

void main() {
  // final dio = MockDio();
  final storage = MockSecureStorage();

  // setUp(() {
  //   storage = MockSecureStorage();
  // });

  tearDown(() {
    resetMocktailState();
  });

  group('SecureStorage', () {
    test('return null if success', () async {
      when(() => storage.set('hello', 'world')).thenAnswer((_) async => null);
      expect(await storage.set("hello", "world"), null);
    });

    test('return error message if failed', () async {
      when(() => storage.set('hello', 'world'))
          .thenAnswer((_) async => "error message");
      expect(await storage.set("hello", "world"), "error message");
    });

    test('return value if success', () async {
      when(() => storage.get<String>("hello", "default"))
          .thenAnswer((_) async => "world");

      expect(await storage.get<String>("hello", "default"), "world");
    });
  });
}
