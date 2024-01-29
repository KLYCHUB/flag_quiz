import 'package:flutter/material.dart';

import '../thema.dart';

class CustomShaderMask extends StatelessWidget {
  const CustomShaderMask({
    super.key,
    required this.shaderMaskText,
    required this.shaderMaskFontSize,
  });

  final String shaderMaskText;
  final double shaderMaskFontSize;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [gradientColor1, gradientColor2],
      ).createShader(bounds),
      child: Text(
        textAlign: TextAlign.start,
        shaderMaskText,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: shaderMaskFontSize,
              color: Colors.white,
              fontWeight: FontWeight.w900,
              letterSpacing: 2,
            ),
      ),
    );
  }
}
