import 'package:dartz/dartz.dart';

import '../../../../core/failures/failure.dart';
import '../../data/models/story_data_model.dart';
import '../repositories/story_reposatory.dart';

class GetAllStoriesUseCase {
  final StoryReposatory _reposatory;

  GetAllStoriesUseCase(this._reposatory);

  Future<Either<Failure, List<StoryDataModel>>> call() async {
    return await _reposatory.getStories();
  }
}
