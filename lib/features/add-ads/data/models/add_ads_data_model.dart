import 'package:rowad_hrag/features/add-ads/domain/entities/add_ads_request.dart';

class AddAdsDataModel extends AddAdsRequest {
  const AddAdsDataModel({
    required super.title,
    required super.description,
    required super.phoneNumber,
    required super.carImages,
    required super.price,
    required super.selectedState,
    required super.selectedCity,
    required super.showPhoneNumber,
    required super.showPrice,
    super.adImages,
    super.condition,
    super.fuel,
    super.gear,
    super.isProductiveFamily,
    super.mileage,
    super.saleType,
    super.selectedBrand,
    super.selectedCarCategory,
    super.selectedCategory,
    super.selectedModel,
  });

  factory AddAdsDataModel.fromJson(Map<String, dynamic> json) {
    return AddAdsDataModel(
      title: json['title'],
      description: json['description'],
      phoneNumber: json['phoneNumber'],
      carImages: json['carImages'],
      price: json['price'],
      selectedState: json['selectedState'],
      selectedCity: json['selectedCity'],
      showPhoneNumber: json['showPhoneNumber'],
      showPrice: json['showPrice'],
      adImages: json['adImages'],
      condition: json['condition'],
      fuel: json['fuel'],
      gear: json['gear'],
      isProductiveFamily: json['isProductiveFamily'],
      mileage: json['mileage'],
      saleType: json['saleType'],
      selectedBrand: json['selectedBrand'],
      selectedCarCategory: json['selectedCarCategory'],
      selectedCategory: json['selectedCategory'],
      selectedModel: json['selectedModel'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'phoneNumber': phoneNumber,
      'carImages': carImages,
      'price': price,
      'selectedState': selectedState,
      'selectedCity': selectedCity,
      'showPhoneNumber': showPhoneNumber,
      'showPrice': showPrice,
      'adImages': adImages,
      'condition': condition,
      'fuel': fuel,
      'gear': gear,
      'isProductiveFamily': isProductiveFamily,
      'mileage': mileage,
      'saleType': saleType,
      'selectedBrand': selectedBrand,
      'selectedCarCategory': selectedCarCategory,
      'selectedCategory': selectedCategory,
      'selectedModel': selectedModel,
    };
  }
}
