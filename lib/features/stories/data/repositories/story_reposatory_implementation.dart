import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:rowad_hrag/core/failures/failures.dart';
import 'package:rowad_hrag/features/stories/data/data_sources/story_interface_data_source.dart';
import 'package:rowad_hrag/features/stories/data/models/story_data_model.dart';

import '../../domain/repositories/story_reposatory.dart';

class StoryReposatoryImplementation implements StoryReposatory {
  late final StoryInterfaceDataSource _dataSource;

  StoryReposatoryImplementation(this._dataSource);

  @override
  Future<Either<Failure, List<StoryDataModel>>> getStories() async {
    try {
      var response = await _dataSource.getStories();

      return Right(response);
    } on FirebaseException catch (error) {
      throw Exception(error);
      return Left(ServerFailure(error: error.message, statusCode: ''));
    }
  }

  @override
  Future<Either<Failure, String>> uploadStory(StoryDataModel story) async {
    try {
      EasyLoading.show();
      var response = await _dataSource.uploadStory(story);
      return Right('تم تحديث الحاله بنجاح');
    } catch (error) {
      return Left(
        ServerFailure(error: error.toString(), statusCode: ''),
      );
    } finally {
      EasyLoading.dismiss();
    }
  }
}
