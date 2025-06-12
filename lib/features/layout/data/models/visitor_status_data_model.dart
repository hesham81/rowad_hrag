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
      visitorSectionText: json['visitors_section_text'],
      visitorsToday: json['visitors_today'],
      itemsSold: json['items_sold_today'],
      totalUsers: json['total_users'],
    );
  }

  Map<String, dynamic> toJson() => {
        "visitors_section_text": visitorSectionText,
        "visitors_today": visitorsToday,
        "items_sold_today": itemsSold,
        "total_users": totalUsers,
      };

// @override
}
