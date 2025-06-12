import 'package:rowad_hrag/features/layout/domain/entities/visitor_status.dart';

class VisitorStatesDataModel extends VisitorState {
  VisitorStatesDataModel({
    required super.visitorSectionText,
    super.visitorsToday,
    super.itemsSold,
    super.totalUsers,
  });

  factory VisitorStatesDataModel.fromJson(Map<String, dynamic> json) {
    return VisitorStatesDataModel(
      visitorSectionText: json['visitorSectionText'],
      visitorsToday: json['visitorsToday'],
      itemsSold: json['itemsSold'],
      totalUsers: json['totalUsers'],
    );
  }

  Map<String, dynamic> toJson() => {
        "visitorSectionText": visitorSectionText,
        "visitorsToday": visitorsToday,
        "itemsSold": itemsSold,
        "totalUsers": totalUsers,
      };

// @override
}
