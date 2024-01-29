import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/nav_button.dart';

class LinkButton extends StatelessWidget {
  const LinkButton({
    super.key,
    required this.url,
    // ignore: non_constant_identifier_names
    required this.linkButtonText,
    required this.faIcons,
  });

  final String url;
  // ignore: non_constant_identifier_names
  final String linkButtonText;
  final FaIcon faIcons;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 64),
      child: NavButton(
        buttonText: linkButtonText,
        onPressed: () async {
          // ignore: deprecated_member_use
          if (await canLaunch(url)) {
            // ignore: deprecated_member_use
            await launch(url);
          } else {
            throw 'Could not launch $url';
          }
        },
        faIcon: faIcons,
      ),
    );
  }
}
