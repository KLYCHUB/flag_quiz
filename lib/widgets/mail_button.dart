import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/nav_button.dart';

class MailButton extends StatelessWidget {
  const MailButton({
    super.key,
    required this.mail,
    // ignore: non_constant_identifier_names
    required this.mailButtonText,
    required this.faIcons,
  });

  final String mail;
  // ignore: non_constant_identifier_names
  final String mailButtonText;
  final FaIcon faIcons;

  @override
  Widget build(BuildContext context) {
    return NavButton(
        buttonText: mailButtonText,
        onPressed: () {
          final Uri params = Uri(
            scheme: 'mailto',
            path: mail, // use the mail variable here
            query: 'subject=Flag Quiz Subject&body=',
          );
          String url = params.toString();
          // ignore: deprecated_member_use
          canLaunch(url).then((value) {
            // use then instead of await
            if (value) {
              // ignore: deprecated_member_use
              launch(url); // no need to await here
            } else {
              if (kDebugMode) {
                print('Could not launch $url');
              }
            }
          });
        },
        faIcon: faIcons);
  }
}
