import 'package:flutter/cupertino.dart';

import '../thema.dart';
import '../utils/constants.dart';
import '../utils/strings.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: logoHeightContanier,
          width: logoWidthContanier,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                gradientColor1,
                gradientColor2,
              ],
            ),
          ),
        ),
        const SizedBox(
          width: logoWidth,
          height: logoHeight,
          child: Padding(
            padding: EdgeInsets.all(paddingEdgeInsetsAll),
            child: Image(
              image: AssetImage(logoAssets),
            ),
          ),
        ),
      ],
    );
  }
}
