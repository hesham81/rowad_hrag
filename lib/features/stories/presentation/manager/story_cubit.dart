import 'dart:io';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:rowad_hrag/core/services/cash_helper.dart';
import 'package:rowad_hrag/features/stories/data/data_sources/story_remote_data_source.dart';
import 'package:rowad_hrag/features/stories/data/repositories/story_reposatory_implementation.dart';
import 'package:rowad_hrag/features/stories/domain/repositories/story_reposatory.dart';
import 'package:rowad_hrag/features/stories/domain/use_cases/upload_story_use_case.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/failures/failure.dart';
import '../../../../core/failures/server_failure.dart';
import '../../data/data_sources/story_interface_data_source.dart';
import '../../data/models/story_data_model.dart';
import '../../domain/use_cases/get_all_stories_use_case.dart';

part 'story_state.dart';

class StoryCubit extends Cubit<StoryState> {
  StoryCubit() : super(StoryInitial()) {
    _setup();
  }

  late StoryReposatory _reposatory;
  late StoryInterfaceDataSource _dataSource;
  late CollectionReference<StoryDataModel> _collection;

  late GetAllStoriesUseCase _getAllStoriesUseCase;
  late UploadStoryUseCase _uploadStoryUseCase;

  void _setup() {
    _collection = FirebaseFirestore.instance
        .collection("stories")
        .withConverter(
      fromFirestore: (snap, _) => StoryDataModel.fromJson(snap.data()!),
      toFirestore: (value, _) => value.toJson(),
    );

    _dataSource = StoryRemoteDataSource(_collection);
    _reposatory = StoryReposatoryImplementation(_dataSource);

    _getAllStoriesUseCase = GetAllStoriesUseCase(_reposatory);
    _uploadStoryUseCase = UploadStoryUseCase(_reposatory);
  }

  Future<String> uploadImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) throw Exception("لم يتم اختيار صورة");

      final instance = Supabase.instance.client.storage.from("images");

      final ext = image.path.split('.').last;
      final random = Random().nextInt(999999);
      final path = "story_$random.$ext";

      final bytes = await File(image.path).readAsBytes();

      await instance.uploadBinary(
        path,
        bytes,
        fileOptions: const FileOptions(upsert: false),
      );

      final url = instance.getPublicUrl(path);
      return url;
    } catch (error) {
      throw Exception("Image Upload Failed: $error");
    }
  }

  Future<void> uploadStory({String? title}) async {
    try {
      emit(UploaderHandlerLoading());
      final imageUrl = await uploadImage();
      final token = await CashHelper.getString("token") ?? "";
      final name = await CashHelper.getString("name") ?? "";
      final image = await CashHelper.getString("image") ?? "";

      final model = StoryDataModel(
        uid: token,
        id: "$token-${DateTime.now().millisecondsSinceEpoch}",
        file: imageUrl,
        createdAt: DateTime.now(),
        numberOfSeen: 0,
        uploaderName: name,
        uploaderImage: image ,
      );

      final response = await _uploadStoryUseCase.call(model);

      response.fold(
            (failure) => emit(UploaderHandlerError(failure: failure)),
            (msg) => emit(UploaderHandlerLoaded(message: msg)),
      );
    } catch (error) {
      emit(
        UploaderHandlerError(
          failure: ServerFailure(error: error.toString(), statusCode: "500"),
        ),
      );
    }
  }

  Future<void> getStories() async {
    try {
      emit(StoryLoading());
      EasyLoading.show();

      final response = await _getAllStoriesUseCase.call();

      response.fold(
            (failure) => emit(StoryError(failure: failure)),
            (stories) => emit(StoryLoaded(stories: stories)),
      );
    } catch (error) {
      emit(
        StoryError(
          failure: ServerFailure(error: error.toString(), statusCode: "500"),
        ),
      );
    } finally {
      EasyLoading.dismiss();
    }
  }
}
