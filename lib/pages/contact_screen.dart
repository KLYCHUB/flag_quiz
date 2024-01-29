// ignore_for_file: file_names

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../ads/banner.dart';
import '../thema.dart';
import '../utils/constants.dart';
import '../utils/strings.dart';
import '../widgets/custom_shader_mask.dart';
import '../widgets/link_button.dart';
import '../widgets/mail_button.dart';
import '../widgets/shader_mask_nav.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
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
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: backgroundColor,
        leading: ShaderMaskNav(
          onPressed: () {
            Navigator.pop(context);
            _showInterstitialAd();
          },
        ),
        title: CustomShaderMask(
          shaderMaskText: 'contact'.tr(),
          shaderMaskFontSize: customTitleLarge,
        ),
      ),
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomShaderMask(
                shaderMaskText: googlePlayStore,
                shaderMaskFontSize: customTitleLarge,
              ),
              LinkButton(
                url: urlGooglePlayStore,
                linkButtonText: 'explore'.tr(),
                faIcons: const FaIcon(FontAwesomeIcons.googlePlay),
              ),
              CustomShaderMask(
                shaderMaskText: 'web_sitesi'.tr(),
                shaderMaskFontSize: customTitleLarge,
              ),
              LinkButton(
                url: urlWebSite,
                linkButtonText: 'visit'.tr(),
                // ignore: deprecated_member_use
                faIcons: const FaIcon(FontAwesomeIcons.earth),
              ),
              const CustomShaderMask(
                shaderMaskText: mailText,
                shaderMaskFontSize: customTitleLarge,
              ),
              MailButton(
                mail: mail,
                mailButtonText: 'send'.tr(),
                faIcons: const FaIcon(FontAwesomeIcons.solidMessage),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBarBannerAds(),
    );
  }
}
