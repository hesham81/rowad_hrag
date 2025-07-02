import '../../domain/entities/add_rate_request.dart';

class CommentRequestDataModel extends AddRateRequest {
  const CommentRequestDataModel({
    required super.comment,
    required super.rate,
  });

  factory CommentRequestDataModel.fromJson(Map<String, dynamic> json) {
    return CommentRequestDataModel(
      comment: json['review'],
      rate: json['rate'],
    );
  }

  Map<String, dynamic> toJson() => {
        'review': comment,
        'rate': rate,
      };
}
