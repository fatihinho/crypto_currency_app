import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdManager {
  static Future<InitializationStatus> initialize() {
    return MobileAds.instance.initialize();
  }

  static String get appId {
    if (Platform.isAndroid) {
      return "ca-app-pub-7581095423661277~5712060679";
    } else if (Platform.isIOS) {
      return "<YOUR_IOS_ADMOB_APP_ID>";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/6300978111"; // test Id
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/2934735716"; // test Id
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/1033173712"; // test Id
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/4411468910"; // test Id
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static InterstitialAd get interstitialAd {
    return InterstitialAd(
      adUnitId: interstitialAdUnitId,
      request: AdRequest(),
      listener: AdListener(),
    )..load();
  }
}
