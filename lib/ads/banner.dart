import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BottomNavBarBannerAds extends StatefulWidget {
  const BottomNavBarBannerAds({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavBarBannerAdsState createState() => _BottomNavBarBannerAdsState();
}

class _BottomNavBarBannerAdsState extends State<BottomNavBarBannerAds> {
  static const String _adUnitId = 'ca-app-pub-1554217925055679/7931997424';

  BannerAd? _bannerAd;
  bool _isBannerAdReady = false;
  // ignore: prefer_final_fields
  List<String> _testDevices = ['1b41c5b1-3a4b-482e-8432-4c5f25f97a36'];

  @override
  void initState() {
    super.initState();
    _loadBannerAd();
  }

  void _loadBannerAd() {
    _bannerAd = BannerAd(
      adUnitId: _adUnitId,
      size: AdSize.banner,
      // ignore: prefer_const_constructors
      request: AdRequest(
        keywords: ['your', 'keywords', 'here'],
        contentUrl: 'your_content_url_here',
      ),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _isBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          // ignore: avoid_print
          print('BannerAd failed to load: $error');
          ad.dispose();
          _loadBannerAd();
        },
      ),
    );

    // Update the request configuration with test device IDs
    MobileAds.instance.updateRequestConfiguration(
        RequestConfiguration(testDeviceIds: _testDevices));

    _bannerAd?.load();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isBannerAdReady) {
      double screenWidth = MediaQuery.of(context).size.width;
      double bannerWidth = _bannerAd!.size.width.toDouble();
      double bannerHeight = _bannerAd!.size.height.toDouble();

      if (bannerWidth > 0 && bannerHeight > 0) {
        double scaleFactor = screenWidth / bannerWidth;
        bannerWidth *= scaleFactor;
        bannerHeight *= scaleFactor;
      }

      return Container(
        alignment: Alignment.center,
        width: bannerWidth,
        height: bannerHeight,
        child: AdWidget(ad: _bannerAd!),
      );
    } else {
      return const SizedBox();
    }
  }
}
