// main.dart

import 'package:easy_localization/easy_localization.dart';
import 'package:flag_quiz/pages/home_page.dart';
import 'package:flag_quiz/thema.dart';
import 'package:flag_quiz/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
// ignore: unnecessary_import
import 'dart:ui';
import 'package:flag_quiz/thema.dart'
    show
        // ignore: undefined_shown_name
        themaTitle,
        theme; // Eğer thema.dart dosyasında tanımlandıysa

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('tr', 'TR')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: themaTitle,
      theme: theme,
      home: const HomePage(),
    );
  }
}
