import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../ads/banner.dart';
import '../thema.dart';
import '../utils/constants.dart';
import '../widgets/custom_shader_mask.dart';
import '../widgets/langue_button.dart';
import '../widgets/logo.dart';
import '../widgets/nav_button.dart';
import 'contact_screen.dart';
import 'game_mode_select.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final result = await showDialog<bool>(
          context: context,
          builder: (context) => Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [gradientColor1, gradientColor2],
              ),
            ),
            child: AlertDialog(
              backgroundColor: backgroundColor,
              title: CustomShaderMask(
                shaderMaskText: 'exit'.tr(),
                shaderMaskFontSize: customTitleMedium,
              ),
              actions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: CustomShaderMask(
                        shaderMaskText: 'no'.tr(),
                        shaderMaskFontSize: customTitleMedium,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        SystemNavigator.pop();
                        Navigator.of(context).pop(true);
                      },
                      child: CustomShaderMask(
                        shaderMaskText: 'yes'.tr(),
                        shaderMaskFontSize: customTitleMedium,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
        return result ?? false;
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: Center(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Logo(),
                  smallSpace,
                  CustomShaderMask(
                    shaderMaskText: 'welcomeLang'.tr(),
                    shaderMaskFontSize: customHeadlineSmall,
                  ),
                  midSpace,
                  NavButton(
                    buttonText: 'play'.tr(),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return const GameModeScreen();
                        },
                      ));
                    },
                    faIcon: const FaIcon(FontAwesomeIcons.play),
                  ),
                  smallSpace,
                  NavButton(
                    buttonText: 'contact'.tr(),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ContactScreen()),
                      );
                    },
                    // ignore: deprecated_member_use
                    faIcon: const FaIcon(FontAwesomeIcons.contactCard),
                  ),
                  smallSpace,
                  LangueButton(
                    onLanguageChange: () {
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: const BottomNavBarBannerAds(),
      ),
    );
  }
}
