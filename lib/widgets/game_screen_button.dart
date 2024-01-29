// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../thema.dart';
import '../utils/constants.dart';

class QuestionButton extends StatelessWidget {
  const QuestionButton({
    Key? key,
    required this.countryName,
    required this.onPressed,
  }) : super(key: key);

  final String countryName;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: gameScreenButtonWidth,
        height: gameScreenButtonHeight,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(gameScreenBorderRadius),
              gradient: const LinearGradient(
                colors: [gradientColor1, gradientColor2],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Container(
              alignment: Alignment.center,
              child: Text(
                countryName,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
