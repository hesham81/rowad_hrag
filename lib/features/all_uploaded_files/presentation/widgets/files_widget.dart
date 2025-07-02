import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/dimensions.dart';
import 'package:rowad_hrag/core/widget/custom_container.dart';
import 'package:rowad_hrag/features/all_uploaded_files/data/models/uploaded_files_data_model.dart';

class FilesWidget extends StatelessWidget {
  final UploadedFilesDataModel filesDataModel;

  const FilesWidget({
    super.key,
    required this.filesDataModel,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: CachedNetworkImage(
              imageUrl: filesDataModel.image,
              height: 0.2.height,
            ),
          ),
          Expanded(
            child: Text(
              filesDataModel.fileName,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
