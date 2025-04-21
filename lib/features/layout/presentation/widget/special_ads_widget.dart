import 'package:flutter/material.dart';
import '/core/extensions/extensions.dart';
import '/core/theme/app_colors.dart';

class SpecialAdsWidget extends StatelessWidget {
  final String title;

  const SpecialAdsWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.35.height,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.grey.withAlpha(80),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.secondaryColor,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back_outlined,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Text(
                title,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ).hPadding(0.02.width),
          0.01.height.hSpace,
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.secondaryColor.withAlpha(120),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        0.05.height.hSpace,
                        Text(
                          "طقم صلاه بناتي",
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        0.01.height.hSpace,
                        Text(
                          "100 ريال",
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    color: Colors.greenAccent,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        0.01.height.hSpace,
                        Text(
                          "المدينه المنوره",
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        0.03.height.hSpace,
                        Row(
                          children: [
                            Text(
                              "منذ شهر",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                    color: Colors.black,
                                  ),
                            ),
                            Spacer(),
                            Text(
                              "Khaled Ebn Hamd",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                    color: Colors.black,
                                  ),
                            ),
                          ],
                        )
                      ],
                    ).hPadding(0.01.width),
                  ),
                  Expanded(
                    flex: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/images/products/1.png",
                      ),
                    ),
                  )
                ],
              ).hPadding(0.01.width),
            ),
          )
        ],
      ),
    );
  }
}
