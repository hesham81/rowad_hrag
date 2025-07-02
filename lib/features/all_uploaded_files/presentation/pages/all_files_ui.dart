import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/dimensions.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/widget/center_text.dart';
import 'package:rowad_hrag/features/all_uploaded_files/data/models/uploaded_files_data_model.dart';
import 'package:rowad_hrag/features/all_uploaded_files/presentation/widgets/files_widget.dart';

class AllFilesUi extends StatelessWidget {
  final List<UploadedFilesDataModel> files;

  const AllFilesUi({
    super.key,
    required this.files,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              itemCount: files.length,
              padding: const EdgeInsets.all(10),
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                mainAxisExtent: 0.3.height,
              ),
              itemBuilder: (context, index) => FilesWidget(
                filesDataModel: files[index],
              ),
            )
          ],
        ),
      ),
    );
  }
}
