import '../../domain/entities/story.dart';

class StoryDataModel extends Story {
  StoryDataModel({
    required super.uid,
    required super.id,
    required super.file,
    required super.createdAt,
    required super.numberOfSeen,
    super.title,
    required super.uploaderName,
    required super.uploaderImage,

  });

  factory StoryDataModel.fromJson(Map<String, dynamic> json) =>
      StoryDataModel(
          id: json["id"],
          title: json["title"],
          file: json["file"],
          createdAt: DateTime.parse(json["createdAt"] as String),
          numberOfSeen: json["numberOfSeen"],
          uid: json["uid"],
          uploaderName: json["uploaderName"],
          uploaderImage: json['uploaderImage'],
      );

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "title": title,
        "file": file,
        "createdAt": createdAt.toString(),
        "numberOfSeen": numberOfSeen,
        "uid": uid,
        "uploaderName": uploaderName,
        "uploaderImage": uploaderImage,
      };
}
