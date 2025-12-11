import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class TextReadmoreWidget extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const TextReadmoreWidget({
    super.key,
    required this.text,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      text,
      trimMode: TrimMode.Line,
      trimLines: 2,
      textDirection: TextDirection.rtl,
      colorClickableText: Colors.pink,
      trimCollapsedText: 'المزيد',
      trimExpandedText: 'اقل',
      moreStyle: style ?? Theme.of(context).textTheme.bodyMedium,
    );
  }
}
