import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class ClickableText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextDirection? textDirection;

  const ClickableText({
    super.key,
    required this.text,
    this.style,
    this.textDirection,
  });

  @override
  Widget build(BuildContext context) {
    return Linkify(
      onOpen: (link) async {
        if (await canLaunchUrl(Uri.parse(link.url))) {
          await launchUrl(Uri.parse(link.url));
        }
      },
      text: text,
      textDirection: textDirection,
      style: style ?? TextStyle(fontSize: 16),
      linkStyle: TextStyle(
        color: Colors.blue,
        decoration: TextDecoration.underline,
      ),
    );
  }
}
