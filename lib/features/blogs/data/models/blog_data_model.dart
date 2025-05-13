import 'package:rowad_hrag/features/blogs/domain/entities/blog.dart';

class BlogDataModel extends Blog {
  BlogDataModel({
    required super.id,
    required super.categoryId,
    required super.title,
    required super.slug,
    required super.shDescription,
    required super.descrption,
    required super.banner,
    required super.createdAt,
  });

  factory BlogDataModel.fromJson(Map<String, dynamic> json) => BlogDataModel(
        id: json["id"],
        categoryId: json["category_id"],
        title: json["title"].toString(),
        slug: json["slug"].toString(),
        shDescription: json["sh_description"].toString(),
        descrption: json["description"].toString(),
        banner: json["banner"],
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "title": title,
        "slug": slug,
        "sh_description": shDescription,
        "description": descrption,
        "banner": banner,
        "created_at": createdAt,
      };
}
