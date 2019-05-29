import 'package:test/test.dart';

// ignore: avoid_relative_lib_imports
import '../lib/name.dart';

void main() {
  test('that the Name class works', () {
    Name n = Name((b) => b
      ..first = 'first'
      ..middle = 'middle'
      ..last = 'last');
    expect(n.first, equals('first'));
    expect(n.middle, equals('middle'));
    expect(n.last, equals('last'));
  });
}
