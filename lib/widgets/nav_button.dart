// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../thema.dart';
import '../utils/constants.dart';

class NavButton extends StatelessWidget {
  const NavButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    required this.faIcon,
  }) : super(key: key);

  final String buttonText;
  final VoidCallback onPressed;
  final FaIcon faIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      child: Container(
        width: buttonWidth,
        height: buttonHeight,
        decoration: buttonDecoration,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: faIcon,
              ),
              Text(
                buttonText,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                      letterSpacing: 2,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
