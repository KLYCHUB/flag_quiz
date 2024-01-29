// theme.dart
import 'package:flag_quiz/utils/constants.dart';
import 'package:flutter/material.dart';

const Color backgroundColor = Color.fromARGB(255, 17, 16, 16);

const Color gradientColor1 = Color(0xFF79FF3A);
const Color gradientColor2 = Color(0xFF00FFF0);

ThemeData theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
);

BoxDecoration buttonDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(borderRadius),
  gradient: const LinearGradient(
    colors: [
      gradientColor1,
      gradientColor2,
    ],
  ),
);
