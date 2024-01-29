// ignore: unnecessary_import
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../pages/game_mode_select.dart';
import '../pages/game_screen.dart';
import '../thema.dart';
import '../utils/constants.dart';

class GameModeSelectButton extends StatelessWidget {
  const GameModeSelectButton({
    super.key,
    required this.countries,
    required this.gameModeButtonText,
    required this.questionsNums,
  });

  final List<Country> countries;
  final String gameModeButtonText;
  final int questionsNums;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          // Quiz ekranını aç
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GameScreen(
                countries: countries,
                questionsNum: questionsNums,
              ),
            ),
          );
        },
        overlayColor: const MaterialStatePropertyAll(Colors.transparent),
        child: Container(
          width: gameSelcetButtonHeight,
          height: gameSelcetButtonWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            gradient: const LinearGradient(
              colors: [
                gradientColor1,
                gradientColor2,
              ],
            ),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: FaIcon(FontAwesomeIcons.flag),
                ),
                Text(
                  gameModeButtonText,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                        letterSpacing: 2,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
