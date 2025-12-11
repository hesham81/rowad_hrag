import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rowad_hrag/features/stories/data/data_sources/story_interface_data_source.dart';
import 'package:rowad_hrag/features/stories/data/models/story_data_model.dart';

class StoryRemoteDataSource implements StoryInterfaceDataSource {
  late final CollectionReference<StoryDataModel> _collection;

  StoryRemoteDataSource(this._collection);

  @override
  Future<List<StoryDataModel>> getStories() async {
    return await _collection
        .get()
        .then((value) => value.docs!.map((e) => e.data()).toList());
  }

  @override
  Future<void> uploadStory(StoryDataModel story) async {
    return await _collection.doc().set(story);
  }
}
