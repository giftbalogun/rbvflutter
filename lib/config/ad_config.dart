import 'dart:io';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdConfig {
  //Enable or Disable Ads
  static const bool isAdsEnabled = true;

  //Set user clicks to show ads in the content description screen
  final int userClicksAmountsToShowEachAd = 3;

  static const String appIdAndroid = 'ca-app-pub-5537701541019565~3170203299';
  static const String appIdiOS = 'ca-app-pub-5537701541019565~3170203299';

  static const String interstitialAdUnitIdAndroid =
      'ca-app-pub-5537701541019565/8640198968';
  static const String interstitialAdUnitIdiOS =
      'ca-app-pub-5537701541019565/8640198968';

  static const String bannerAdUnitIdAndroid =
      'ca-app-pub-5537701541019565/6267193824';
  static const String bannerAdUnitIdiOS =
      'ca-app-pub-5537701541019565/6267193824';

  // -- Don't edit these --

  Future initAdmob() async {
    await MobileAds.instance.initialize();
  }

  String getAdmobAppId() {
    if (Platform.isAndroid) {
      return appIdAndroid;
    } else {
      return appIdiOS;
    }
  }

  String getBannerAdUnitId() {
    if (Platform.isAndroid) {
      return bannerAdUnitIdAndroid;
    } else {
      return bannerAdUnitIdiOS;
    }
  }

  String getInterstitialAdUnitId() {
    if (Platform.isAndroid) {
      return interstitialAdUnitIdAndroid;
    } else {
      return interstitialAdUnitIdiOS;
    }
  }
}
