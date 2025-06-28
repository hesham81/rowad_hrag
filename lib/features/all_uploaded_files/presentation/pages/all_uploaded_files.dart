import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/widget/icon_error.dart';
import 'package:rowad_hrag/features/all_uploaded_files/presentation/manager/files_cubit.dart';
import 'package:rowad_hrag/features/all_uploaded_files/presentation/pages/all_files_ui.dart';

import '../../../../core/theme/app_colors.dart';

class AllUploadedFiles extends StatelessWidget {
  const AllUploadedFiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "الملفات التي يتم تحميلها",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.primaryColor,
          ),
        ),
      ),
      body: BlocBuilder<FilesCubit, FilesState>(
        builder: (context, state) {
          if (state is FilesLoaded) {
            return AllFilesUi(files: state.files);
          } else if (state is FilesError) {
            return IconError(error: state.message);
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.secondaryColor,
              ),
            );
          }
        },
      ),
    );
  }
}
