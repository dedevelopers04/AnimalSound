
import 'package:flutter/services.dart';

class OrientationScr{
      OrientationScr._();
  static void getLandScapMode(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);

  }

}