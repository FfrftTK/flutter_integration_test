import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';

Future<void> takeScreenshot(FlutterDriver driver, String path) async {
  print('will take screenshot $path');
  final pixels = await driver.screenshot();
  final file = File(path);
  await file.writeAsBytes(pixels);
  print('wrote $file');
}
