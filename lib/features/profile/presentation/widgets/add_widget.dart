import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/dimensions.dart';
import 'package:rowad_hrag/core/widget/custom_container.dart';
import 'package:rowad_hrag/features/profile/data/models/all_adds_data_model.dart';

class AddWidget extends StatelessWidget {
  final AllAddsDataModel add;

  const AddWidget({
    super.key,
    required this.add,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CachedNetworkImage(
            imageUrl: add.imageUrl,
            height: 0.09.height,
          ),
          Text(
            add.fileOriginalName.replaceFirst(
              ".jpg",
              "",
            ),
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
          ),
        ],
      ),
    );
  }
}
