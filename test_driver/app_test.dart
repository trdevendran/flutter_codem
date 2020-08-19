import 'package:screenshots/screenshots.dart';
final config = Config();

void main() {
  FlutterDriver driver;
  final buttonFinder = find.byType('FloatingActionButton');
  final textFinder = find.byValueKey('count-value');
  group('Full body test', () {

    setUpAll(
          () async {
        driver = await FlutterDriver.connect();
      },
    );
    test(
        'Increment counter',
            () async {
          await driver.tap(buttonFinder);
          expect(await driver.getText(textFinder), "1");
          await screenshot(driver, config, 'testing');
        }),
    );
    tearDownAll(() {
    if (driver != null) {
    driver.close();
    }
    });
  });
}