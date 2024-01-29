import 'package:flutter/material.dart';

import '../thema.dart';

class ShaderMaskNav extends StatelessWidget {
  const ShaderMaskNav({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
          colors: [gradientColor1, gradientColor2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ).createShader(bounds);
      },
      child: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          onPressed();
        },
        iconSize: 24.0,
        color: Colors.white,
      ),
    );
  }
}
