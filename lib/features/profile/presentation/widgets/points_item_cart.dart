import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/align.dart';
import 'package:rowad_hrag/core/extensions/alignment.dart';
import 'package:rowad_hrag/core/extensions/dimensions.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';

class PointsItemCart extends StatelessWidget {
  final Color color;
  final String title;
  final String desc;
  final String totalPoints;

  final String balance;

  const PointsItemCart({
    super.key,
    required this.color,
    required this.title,
    required this.totalPoints,
    required this.balance, required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: .7,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Container(
                width: double.maxFinite,
                height: 0.05.height,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  title,
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ).rightBottomWidget(),
              ),
              Column(
                children: [
                  Text(
                    desc,
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                  0.01.height.hSpace,
                  Text(
                    totalPoints,
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.black,
                    ),
                  ),
                  0.01.height.hSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "ريال",
                        style:
                        Theme
                            .of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.black,
                        ),
                      ),
                      0.02.width.vSpace,
                      Text(
                        balance,
                        style:
                        Theme
                            .of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ).center,
                  0.02.height.hSpace,
                ],
              ).center
            ],
          ),
        ),
      ],
    );
  }
}
