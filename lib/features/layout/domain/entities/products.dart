class Products {
  final int id;

  final String slug;

  final String name;

  final String thumbnailImage;
  final bool? hasDiscount;

  final String? discount;

  final String strokedPrice;

  final String mainPrice;

  final String rating;

  //
  final String sales;

  Products({
    required this.id,
    required this.slug,
    required this.name,
    required this.thumbnailImage,
    required this.hasDiscount,
    required this.discount,
    required this.strokedPrice,
    required this.mainPrice,
    required this.rating,
    required this.sales,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Products &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          slug == other.slug &&
          name == other.name &&
          thumbnailImage == other.thumbnailImage &&
          hasDiscount == other.hasDiscount &&
          discount == other.discount &&
          strokedPrice == other.strokedPrice &&
          mainPrice == other.mainPrice &&
          rating == other.rating &&
          sales == other.sales;

  @override
  int get hashCode =>
      id.hashCode ^
      slug.hashCode ^
      name.hashCode ^
      thumbnailImage.hashCode ^
      hasDiscount.hashCode ^
      discount.hashCode ^
      strokedPrice.hashCode ^
      mainPrice.hashCode ^
      rating.hashCode ^
      sales.hashCode;
}
