import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rowad_hrag/features/layout/data/models/top_sellers_data_model.dart';

class BiggestSellerCart extends StatelessWidget {
  final TopSellersDataModel topSellersDataModel;

  const BiggestSellerCart({
    super.key,
    required this.topSellersDataModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: CachedNetworkImageProvider(
            topSellersDataModel.logo,
          ),
          radius: 80,
        ),
        Expanded(
          child: Text(
            topSellersDataModel.name,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        Expanded(
          child: Text(
            "(${topSellersDataModel.rating}) التقييمات",
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ],
    );
  }
}
