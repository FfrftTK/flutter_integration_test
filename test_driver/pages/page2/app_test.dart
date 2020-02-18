import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import '../../constants.dart';
import '../../utils/screenshot.dart';

void main() {
  const pageName = 'page2';
  const screenshotStoragePath = '$screenshotPath/$pageName';
  group('Counter App', () {
    final counterTextFinder = find.byValueKey('counter');
    final buttonFinder = find.byValueKey('increment');

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
      await Directory(screenshotStoragePath).create();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('check flutter driver extension', () async {
      final health = await driver.checkHealth();
      print(health.status);
    });

    test('starts at 0', () async {
      print('$screenshotStoragePath/topstarts_at_0.png');
      expect(await driver.getText(counterTextFinder), "0");
      await takeScreenshot(driver, '$screenshotStoragePath/topstarts_at_0.png');
    });

    test('increments the counter', () async {
      await driver.tap(buttonFinder);
      expect(await driver.getText(counterTextFinder), "1");
      await takeScreenshot(
          driver, '$screenshotStoragePath/increments_the_counter.png');
    });
  });
}
