import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../ads/banner.dart';
import '../thema.dart';
import '../utils/constants.dart';
import '../utils/flagString.dart';
import '../widgets/custom_shader_mask.dart';
import '../widgets/game_mode_select_button.dart';
import '../widgets/shader_mask_nav.dart';

class Country {
  final String name;
  final String flag;

  Country({required this.name, required this.flag});
}

class GameModeScreen extends StatefulWidget {
  const GameModeScreen({super.key});

  @override
  State<GameModeScreen> createState() => _GameModeScreenState();
}

class _GameModeScreenState extends State<GameModeScreen> {
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
    List<Country> countries = [
      Country(name: 'Turkiye'.tr(), flag: turkeyFlag),
      Country(name: 'Almanya'.tr(), flag: germanyFlag),
      Country(name: 'Fransa'.tr(), flag: franceFlag),
      Country(name: 'Italya'.tr(), flag: italyFlag),
      Country(name: 'Ispanya'.tr(), flag: spainFlag),
      Country(name: 'Portekiz'.tr(), flag: portugalFlag),
      Country(name: 'Irlanda'.tr(), flag: irelandFlag),
      Country(name: 'Hollanda'.tr(), flag: netherlandsFlag),
      Country(name: 'Belcika'.tr(), flag: belgiumFlag),
      Country(name: 'Luksemburg'.tr(), flag: luxembourgFlag),
      Country(name: 'Isvicre'.tr(), flag: switzerlandFlag),
      Country(name: 'Avusturya'.tr(), flag: austriaFlag),
      Country(name: 'Cekya'.tr(), flag: czechiaFlag),
      Country(name: 'Polonya'.tr(), flag: polandFlag),
      Country(name: 'Macaristan'.tr(), flag: hungaryFlag),
      Country(name: 'Romanya'.tr(), flag: romaniaFlag),
      Country(name: 'Bulgaristan'.tr(), flag: bulgariaFlag),
      Country(name: 'Yunanistan'.tr(), flag: greeceFlag),
      Country(name: 'Isvec'.tr(), flag: swedenFlag),
      Country(name: 'Norvec'.tr(), flag: norwayFlag),
      Country(name: 'Danimarka'.tr(), flag: denmarkFlag),
      Country(name: 'Finlandiya'.tr(), flag: finlandFlag),
      Country(name: 'Estonya'.tr(), flag: estoniaFlag),
      Country(name: 'Letonya'.tr(), flag: latviaFlag),
      Country(name: 'Litvanya'.tr(), flag: lithuaniaFlag),
      Country(name: 'Hirvatistan'.tr(), flag: croatiaFlag),
      Country(name: 'Sirbistan'.tr(), flag: serbiaFlag),
      Country(name: 'Karadag'.tr(), flag: montenegroFlag),
      Country(name: 'Kosova'.tr(), flag: kosovoFlag),
      Country(name: 'Bosna-Hersek'.tr(), flag: bosniaHerzegovinaFlag),
      Country(name: 'Kuzey_Makedonya'.tr(), flag: northMacedoniaFlag),
      Country(name: 'Arnavutluk'.tr(), flag: albaniaFlag),
      Country(name: 'Slovenya'.tr(), flag: sloveniaFlag),
      Country(name: 'Slovakya'.tr(), flag: slovakiaFlag),
      Country(name: 'Moldova'.tr(), flag: moldovaFlag),
      Country(name: 'Ukrayna'.tr(), flag: ukraineFlag),
      Country(name: 'Belarus'.tr(), flag: belarusFlag),
      Country(name: 'Rusya'.tr(), flag: russiaFlag),
      Country(name: 'Gurcistan'.tr(), flag: georgiaFlag),
      Country(name: 'Azerbaycan'.tr(), flag: azerbaijanFlag),
      Country(name: 'Izlanda'.tr(), flag: icelandFlag),
      Country(name: 'Malta'.tr(), flag: maltaFlag),
      Country(name: 'Kibris'.tr(), flag: cyprusFlag),
      Country(name: 'Andorra'.tr(), flag: andorraFlag),
      Country(name: 'Monako'.tr(), flag: monacoFlag),
      Country(name: 'Liechtenstein'.tr(), flag: liechtensteinFlag),
      Country(name: 'San_Marino'.tr(), flag: sanMarinoFlag),
      Country(name: 'Vatikan'.tr(), flag: vaticanCityFlag),
      Country(name: 'Ermenistan'.tr(), flag: armeniaFlag),
      Country(name: 'Bahreyn'.tr(), flag: bahrainFlag),
      Country(name: 'Banglades'.tr(), flag: bangladeshFlag),
      Country(name: 'Bhutan'.tr(), flag: bhutanFlag),
      Country(name: 'Brunei'.tr(), flag: bruneiFlag),
      Country(name: 'Kambocya'.tr(), flag: cambodiaFlag),
      Country(name: 'Cin'.tr(), flag: chinaFlag),
      Country(name: 'Hindistan'.tr(), flag: indiaFlag),
      Country(name: 'Endonezya'.tr(), flag: indonesiaFlag),
      Country(name: 'Iran'.tr(), flag: iranFlag),
      Country(name: 'Irak'.tr(), flag: iraqFlag),
      Country(name: 'Israil'.tr(), flag: israelFlag),
      Country(name: 'Japonya'.tr(), flag: japanFlag),
      Country(name: 'Urdun'.tr(), flag: jordanFlag),
      Country(name: 'Kazakistan'.tr(), flag: kazakhstanFlag),
      Country(name: 'Kuzey_Kore'.tr(), flag: northKoreaFlag),
      Country(name: 'Kuveyt'.tr(), flag: kuwaitFlag),
      Country(name: 'Kirgizistan'.tr(), flag: kyrgyzstanFlag),
      Country(name: 'Laos'.tr(), flag: laosFlag),
      Country(name: 'Lubnan'.tr(), flag: lebanonFlag),
      Country(name: 'Malezya'.tr(), flag: malaysiaFlag),
      Country(name: 'Maldivler'.tr(), flag: maldivesFlag),
      Country(name: 'Myanmar'.tr(), flag: myanmarFlag),
      Country(name: 'Nepal'.tr(), flag: nepalFlag),
      Country(name: 'Pakistan'.tr(), flag: pakistanFlag),
      Country(name: 'Filipinler'.tr(), flag: philippinesFlag),
      Country(name: 'Katar'.tr(), flag: qatarFlag),
      Country(name: 'Suudi_Arabistan'.tr(), flag: saudiArabiaFlag),
      Country(name: 'Singapur'.tr(), flag: singaporeFlag),
      Country(name: 'Sri_Lanka'.tr(), flag: sriLankaFlag),
      Country(name: 'Suriye'.tr(), flag: syriaFlag),
      Country(name: 'Tacikistan'.tr(), flag: tajikistanFlag),
      Country(name: 'Tayland'.tr(), flag: thailandFlag),
      Country(name: 'Dogu_Timor'.tr(), flag: eastTimorFlag),
      Country(name: 'Turkmenistan'.tr(), flag: turkmenistanFlag),
      Country(
          name: 'Birlesik_Arap_Emirlikleri'.tr(), flag: unitedArabEmiratesFlag),
      Country(name: 'Ozbekistan'.tr(), flag: uzbekistanFlag),
      Country(name: 'Vietnam'.tr(), flag: vietnamFlag),
      Country(name: 'Yemen'.tr(), flag: yemenFlag),
      Country(name: 'Kuzey_Kibris'.tr(), flag: northernCyprusFlag),
      Country(name: 'Tayvan'.tr(), flag: taiwanFlag),
      Country(name: 'Antigua_ve_Barbuda'.tr(), flag: antiguaBarbudaFlag),
      Country(name: 'Bahamalar'.tr(), flag: bahamasFlag),
      Country(name: 'Barbados'.tr(), flag: barbadosFlag),
      Country(name: 'Belize'.tr(), flag: belizeFlag),
      Country(name: 'Kanada'.tr(), flag: canadaFlag),
      Country(name: 'Kosta_Rika'.tr(), flag: costaRicaFlag),
      Country(name: 'Kuba'.tr(), flag: cubaFlag),
      Country(name: 'Dominika'.tr(), flag: dominicaFlag),
      Country(name: 'Dominik_Cumhuriyeti'.tr(), flag: dominicanRepublicFlag),
      Country(name: 'El_Salvador'.tr(), flag: elSalvadorFlag),
      Country(name: 'Grenada'.tr(), flag: grenadaFlag),
      Country(name: 'Guatemala'.tr(), flag: guatemalaFlag),
      Country(name: 'Haiti'.tr(), flag: haitiFlag),
      Country(name: 'Honduras'.tr(), flag: hondurasFlag),
      Country(name: 'Jamaika'.tr(), flag: jamaicaFlag),
      Country(name: 'Meksika'.tr(), flag: mexicoFlag),
      Country(name: 'Nikaragua'.tr(), flag: nicaraguaFlag),
      Country(name: 'Panama'.tr(), flag: panamaFlag),
      Country(name: 'Saint_Kitts_ve_Nevis'.tr(), flag: saintKittsNevisFlag),
      Country(name: 'Saint_Lucia'.tr(), flag: saintLuciaFlag),
      Country(
          name: 'Saint_Vincent_ve_Grenadinler'.tr(),
          flag: saintVincentGrenadinesFlag),
      Country(name: 'Trinidad_ve_Tobago'.tr(), flag: trinidadTobagoFlag),
      Country(name: 'Amerika_Birlesik_Devletleri'.tr(), flag: unitedStatesFlag),
      Country(name: 'Cezayir'.tr(), flag: algeriaFlag),
      Country(name: 'Angola'.tr(), flag: angolaFlag),
      Country(name: 'Benin'.tr(), flag: beninFlag),
      Country(name: 'Botsvana'.tr(), flag: botswanaFlag),
      Country(name: 'Burkina_Faso'.tr(), flag: burkinaFasoFlag),
      Country(name: 'Burundi'.tr(), flag: burundiFlag),
      Country(name: 'Cibuti'.tr(), flag: djiboutiFlag),
      Country(name: 'Cad'.tr(), flag: chadFlag),
      Country(
          name: 'Demokratik_Kongo_Cumhuriyeti'.tr(),
          flag: democraticRepublicCongoFlag),
      Country(name: 'Ekvator_Ginesi'.tr(), flag: equatorialGuineaFlag),
      Country(name: 'Eritre'.tr(), flag: eritreaFlag),
      Country(name: 'Etiyopya'.tr(), flag: ethiopiaFlag),
      Country(name: 'Fas'.tr(), flag: moroccoFlag),
      Country(name: 'Fildisi_Sahili'.tr(), flag: ivoryCoastFlag),
      Country(name: 'Gabon'.tr(), flag: gabonFlag),
      Country(name: 'Gambiya'.tr(), flag: gambiaFlag),
      Country(name: 'Gana'.tr(), flag: ghanaFlag),
      Country(name: 'Gine'.tr(), flag: guineaFlag),
      Country(name: 'Gine-Bissau'.tr(), flag: guineaBissauFlag),
      Country(name: 'Guney_Afrika'.tr(), flag: southAfricaFlag),
      Country(name: 'Guney_Sudan'.tr(), flag: southSudanFlag),
      Country(name: 'Kamerun'.tr(), flag: cameroonFlag),
      Country(name: 'Kape_Verde'.tr(), flag: capeVerdeFlag),
      Country(name: 'Kenya'.tr(), flag: kenyaFlag),
      Country(name: 'Kongo_Cumhuriyeti'.tr(), flag: republicCongoFlag),
      Country(name: 'Liberya'.tr(), flag: liberiaFlag),
      Country(name: 'Libya'.tr(), flag: libyaFlag),
      Country(name: 'Madagaskar'.tr(), flag: madagascarFlag),
      Country(name: 'Malavi'.tr(), flag: malawiFlag),
      Country(name: 'Mali'.tr(), flag: maliFlag),
      Country(name: 'Namibya'.tr(), flag: namibiaFlag),
      Country(name: 'Arjantin'.tr(), flag: argentinaFlag),
      Country(name: 'Bolivya'.tr(), flag: boliviaFlag),
      Country(name: 'Brezilya'.tr(), flag: brazilFlag),
      Country(name: 'Sili'.tr(), flag: chileFlag),
      Country(name: 'Kolombiya'.tr(), flag: colombiaFlag),
      Country(name: 'Ekvador'.tr(), flag: ecuadorFlag),
      Country(name: 'Guyana'.tr(), flag: guyanaFlag),
      Country(name: 'Paraguay'.tr(), flag: paraguayFlag),
      Country(name: 'Moglistan'.tr(), flag: mongoliaFlag),
      Country(name: 'Umman'.tr(), flag: omanFlag),
      Country(name: 'Peru'.tr(), flag: peruFlag),
      Country(name: 'Surinam'.tr(), flag: surinameFlag),
      Country(name: 'Uruguay'.tr(), flag: uruguayFlag),
      Country(name: 'Venezuela'.tr(), flag: venezuelaFlag),
      Country(name: 'Esvatini'.tr(), flag: eswatiniFlag),
      Country(name: 'Ingiltere'.tr(), flag: englandFlag),
      Country(name: 'Afganistan'.tr(), flag: afghanistanFlag),
    ];

    final random = Random();
    countries.shuffle(random);

    const spacer = Spacer(
      flex: 2,
    );

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
            shaderMaskText: 'game_mode_select'.tr(),
            shaderMaskFontSize: customTitleLarge,
          )),
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              spacer,
              GameModeSelectButton(
                countries: countries,
                gameModeButtonText: 'questions40'.tr(),
                questionsNums: questionsNums1,
              ),
              const Spacer(),
              GameModeSelectButton(
                countries: countries,
                gameModeButtonText: 'questions80'.tr(),
                questionsNums: questionsNums2,
              ),
              const Spacer(),
              GameModeSelectButton(
                countries: countries,
                gameModeButtonText: 'questions160'.tr(),
                questionsNums: questionsNums3,
              ),
              spacer
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBarBannerAds(),
    );
  }
}
