import 'package:dartz/dartz.dart';

import '../../../../core/failures/failure.dart';
import '../../data/models/story_data_model.dart';
import '../repositories/story_reposatory.dart';

class UploadStoryUseCase {
  final StoryReposatory _reposatory;

  UploadStoryUseCase(this._reposatory);

  Future<Either<Failure, String>> call(StoryDataModel story) async {
    return await _reposatory.uploadStory(story);
  }
}