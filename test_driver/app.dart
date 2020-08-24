import 'package:flutterapp/flavors/deva/main_dev.dart' as deva;
import 'package:flutterapp/flavors/aj/main_beta.dart' as aj;
import 'package:flutterapp/flavors/ula/main_dev.dart' as ula;
import 'package:flutter_driver/driver_extension.dart';
main() {
  enableFlutterDriverExtension();
  const APP_ENV = String.fromEnvironment('FL_ENV', defaultValue: 'aj');
  switch(APP_ENV){
    case 'aj':
      aj.main();
      break;
    case 'deva':
      deva.main();
      break;
    case 'ula':
      ula.main();
      break;
  }
}