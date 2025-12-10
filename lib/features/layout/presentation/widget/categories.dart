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
    "assets/images/categories/jeep_12567224.png",
    "assets/images/categories/real-state_1473522.png",
    "assets/images/categories/responsive_896493.png",
    "assets/images/categories/farm_10738009.png",
    "assets/images/categories/bureau_18078478.png",
    "assets/images/categories/stationery_11287365.png",
    "assets/images/categories/service_11515286.png",
    "assets/images/categories/job_3850285.png",
    "assets/images/categories/lunch_1257337.png",
    "assets/images/categories/programming_2091424.png",
    "assets/images/categories/book-shelf_10997264.png",
    "assets/images/categories/hobby_5526337.png",
    "assets/images/categories/all_5110796.png",
    "assets/images/categories/clothes_6973297.png",
    "assets/images/categories/smartwatch_9409299.png",
    "assets/images/categories/bicycle_4269201.png",
    "assets/images/categories/protocol_3755256.png",
    "assets/images/categories/stationery_11287365.png",
    "assets/images/categories/maintenance_3779709.png",
    "assets/images/categories/improvement_5487606.png",
    "assets/images/categories/vase_4699403.png",

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
