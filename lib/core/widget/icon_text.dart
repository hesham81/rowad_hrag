import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/dimensions.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';

class IconText extends StatelessWidget {
  final num rate;

  const IconText({
    super.key,
    required this.rate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$rate",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
        ),
        0.01.width.vSpace,
        Icon(
          Icons.star,
          color: Colors.amber,
        ),
      ],
    );
  }
}
