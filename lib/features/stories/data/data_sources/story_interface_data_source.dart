import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/story_data_model.dart';

abstract class StoryInterfaceDataSource {
  Future<List<StoryDataModel>> getStories();

  Future<void> uploadStory(StoryDataModel story);
}
