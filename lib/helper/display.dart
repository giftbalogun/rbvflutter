import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:rbvflutter/helper/ads.dart';

const int maxFailedLoadAttempts = 3;
const String testDevice = '32A3A411587C195EEE12AE7620855350';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late BannerAd bannerAd;
  bool isLoaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: "ca-app-pub-3940256099942544/6300978111",
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            isLoaded = true;
          });
          print("Banner Ad Loaded");
        },
        onAdFailedToLoad: (ad, error) {
          isLoaded = false;
          print('Failed to load a banner ad: ${error.message}');
        },
      ),
      request: const AdRequest(),
    );
    bannerAd.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bottomNavigationBar: _isBottomBannerAdLoaded
      //    ? Container(
      //        height: _bottomBannerAd.size.height.toDouble(),
      //        width: _bottomBannerAd.size.width.toDouble(),
      //        child: AdWidget(ad: _bottomBannerAd),
      //      )
      //    : null,
      body: Container(
        child: Column(
          children: [
            const Spacer(),
            isLoaded
                ? Container(
                    height: 50,
                    child: AdWidget(
                      ad: bannerAd,
                    ),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
