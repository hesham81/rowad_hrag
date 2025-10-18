import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/align.dart';
import '/core/extensions/extensions.dart';
import '/core/theme/app_colors.dart';

class Categories extends StatefulWidget {
  final String imageUrl;
  final int index;

  final String text;

  const Categories({
    super.key,
    required this.imageUrl,
    required this.text,
    required this.index,
  });

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> images = [
    "assets/icons/eb0c1e622681d8f28fbc41eca59e157b62e96b0e.png",
    "assets/icons/b5310ee5171dc6cdff8a9139b8c48ec910b1abee.png",
    "assets/icons/c15a8f1b7596107f3ddf45e53ea3886fbd437142.png",
    "assets/icons/6a132e807eb36181aa6f63a3379e0b9d7cd0d858.png",
    "assets/icons/e30be8c88d884c8ae4967ac078d2ee32b698453a.png",
    "assets/icons/ce0450b31ef5929a8f5777cdb3855e2f36e50542.png",
    "assets/icons/c15a8f1b7596107f3ddf45e53ea3886fbd437142.png",
    "assets/icons/6a132e807eb36181aa6f63a3379e0b9d7cd0d858.png",
  ];
  List<Color> colors = [
    Color(0xff755738),
    Color(0xff56BCF2),
    Color.fromRGBO(136, 0, 113, 0.67),
    Color.fromRGBO(0, 14, 136, 0.61),
    Color(0xffD53E40),
    Color(0xff18415A),
    Color(0xff25CA67),
    Color(0xff55697C),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      alignment: Alignment.center,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: colors[widget.index],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Image.asset(
        images[widget.index],
        height: 45,
        width: 45,
      ).center,
    );
  }
}
