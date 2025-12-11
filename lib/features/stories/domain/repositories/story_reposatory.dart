import 'package:dartz/dartz.dart';

import '../../../../core/failures/failure.dart';
import '../../data/models/story_data_model.dart';

abstract class StoryReposatory {
  Future<Either<Failure, List<StoryDataModel>>> getStories();

  Future<Either<Failure, String>> uploadStory(StoryDataModel story);
}
