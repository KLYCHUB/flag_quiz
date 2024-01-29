// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class InterstitialAdmob extends StatefulWidget {
  const InterstitialAdmob({Key? key}) : super(key: key);

  @override
  _InterstitialAdmobState createState() => _InterstitialAdmobState();
}

class _InterstitialAdmobState extends State<InterstitialAdmob> {
  late InterstitialAd _interstitialAd;
  bool _isAdLoaded = false;
  // ignore: prefer_final_fields
  List<String> _testDevices = ['1b41c5b1-3a4b-482e-8432-4c5f25f97a36'];

  @override
  void initState() {
    super.initState();
    _initAd();
  }

  void _initAd() {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-1554217925055679/1843680341',
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          setState(() {
            _interstitialAd = ad;
            _isAdLoaded = true;
          });
        },
        onAdFailedToLoad: (error) {
          // ignore: avoid_print
          print('InterstitialAd failed to load: $error');
          // Hata durumunu işleyin veya gerekli adımları atın
        },
      ),
    );
    MobileAds.instance.updateRequestConfiguration(
        RequestConfiguration(testDeviceIds: _testDevices));
  }

  void _showInterstitialAd() {
    if (_isAdLoaded) {
      _interstitialAd.show();
      _interstitialAd.dispose(); // Reklam gösterildiğinde nesneyi temizle
      _isAdLoaded = false; // Reklamın artık yüklü olmadığını belirtin
      _initAd(); // Yeni bir reklam yüklemeye başlayın
    } else {
      // ignore: avoid_print
      print('InterstitialAd is not loaded yet.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _showInterstitialAd,
      child: const Text('Show Interstitial Ad'),
    );
  }
}
