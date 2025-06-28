import 'dart:io';

import 'package:equatable/equatable.dart';

class AddAdsRequest extends Equatable {
  final String title;

  final String description;

  final String? selectedCategory;
  final String? selectedBrand;

  final String? selectedModel;

  final String? selectedCarCategory;

  final String? saleType;

  final String? condition;

  final String? gear;

  final String? fuel;

  final double? mileage;

  final String phoneNumber;

  final List<File> carImages;

  final List<File>? adImages;

  final double price;

  final int selectedState;

  final int selectedCity;

  final bool showPhoneNumber;

  final bool showPrice;

  final bool? isProductiveFamily;

  const AddAdsRequest({
    required this.title,
    required this.description,
    this.selectedCategory,
    this.selectedBrand,
    this.selectedModel,
    this.selectedCarCategory,
    this.saleType,
    this.condition,
    this.gear,
    this.fuel,
    this.mileage,
    required this.phoneNumber,
    required this.carImages,
    this.adImages,
    required this.price,
    required this.selectedState,
    required this.selectedCity,
    required this.showPhoneNumber,
    required this.showPrice,
    this.isProductiveFamily,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        title,
        description,
        selectedCategory,
        selectedBrand,
        selectedModel,
        selectedCarCategory,
        saleType,
        condition,
        gear,
        fuel,
        mileage,
        phoneNumber,
        carImages,
        adImages,
        price,
        selectedState,
        selectedCity,
        showPhoneNumber,
        showPrice,
        isProductiveFamily,
      ];
}
