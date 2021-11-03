import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() {
  setUp(() {
    Hive.init('database');
  });
  test('Name Box Create and Put', () async {
    final box = await Hive.openBox<String>('hwa');
    await box.add('veli');
    expect(box.values.first, 'veli');
  });

  test('Name Box Create and Put', () async {
    final themaBox = await Hive.openBox<bool>('theme');
    await themaBox.put('theme', true);

    expect(themaBox.get('theme'), true);
  });

  test('Name Box Add List', () async {
    final box = await Hive.openBox<String>('hwa');
    await box.clear();
    List<String> items = List.generate(100, (index) => '$index');
    await box.addAll(items);

    expect(box.values.first, '0');
  });

  test('Name Box Put Items', () async {
    final box = await Hive.openBox<String>('demos');

    List<MapEntry<String, String>> items = List.generate(100, (index) => MapEntry('$index - $index', 'veli $index'));
    await box.putAll(Map.fromEntries(items));

    expect(box.get('99 - 99'), 'veli 99');
  });
}
