import '../../domain/entities/onboarding.dart';

class OnboardingModel extends Onboarding {
  const OnboardingModel(
      {required String data})
      : super(data: data);

  OnboardingModel copyWith({
    String? data,
  }) {
    return OnboardingModel(
      data: data ?? this.data  ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    "data": data,
  };

  factory OnboardingModel.fromJson(Map<String, dynamic> json) => OnboardingModel(
    data: json["data"],
  );
}

