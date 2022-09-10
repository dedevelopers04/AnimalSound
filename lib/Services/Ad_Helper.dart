import 'dart:io';

class AdHelper {

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      ///test
    //  return 'ca-app-pub-3940256099942544/6300978111';
      ///live old
     // return 'ca-app-pub-2990398528283681/1278990710';
      ///live
      return 'ca-app-pub-9339493809775289/1729011880';
    } else if (Platform.isIOS) {

      return 'ca-app-pub-3940256099942544/2934735716';
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      ///test
    // return "ca-app-pub-3940256099942544/1033173712";
      ///live
      return "ca-app-pub-9339493809775289/4779569251";

    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/4411468910";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      ///test
     // return "ca-app-pub-3940256099942544/5224354917";
      ///live old
     // return "ca-app-pub-2990398528283681/1377356771";
     ///live
      return "ca-app-pub-9339493809775289/1729011880";

    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/1712485313";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }
}