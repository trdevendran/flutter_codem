// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart' as test;
import 'package:screenshots/screenshots.dart';

final config = Config();

void main() {
  FlutterDriver driver;
  final buttonFinder = find.byType('FloatingActionButton');
  final textFinder = find.byValueKey('count-value');
  test.group('Full body test', () {
    test.setUpAll(
      () async {
        driver = await FlutterDriver.connect();
        await driver.clearTimeline();
      },
    );
    test.test('Increment counter', () async {
      await driver.runUnsynchronized(() async {
        await driver.waitFor(buttonFinder);
        await delay(750);
        await driver.tap(buttonFinder);
//        test.expect(await driver.getText(textFinder), "1");
//        await driver.waitFor(find.text("Loading"));
        await screenshot(driver, config, 'testing');
      });
    });
  });
  test.tearDownAll(() {
    if (driver != null) {
      driver.close();
    }
  });
}

Future<void> delay([int milliseconds = 250]) async {
  await Future<void>.delayed(Duration(milliseconds: milliseconds));
}