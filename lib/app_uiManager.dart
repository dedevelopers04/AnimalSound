import 'dart:ui';
import 'package:flutter/src/widgets/framework.dart';

import 'Widget/UiManager.dart';
class AppUIManager extends UIManager {
  AppUIManager._(context) : super(context);

  static AppUIManager of(BuildContext context) {
    assert(context != null);
    return AppUIManager._(context);
  }

  @override
  Size referenceModel() {
    return Size(360, 778);
  }
}
