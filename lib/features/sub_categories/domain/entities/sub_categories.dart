class SubCategories {
  final int id;

  final String slug;

  final String name;

  final String banner;

  final String icon;

  final int numberOfChildren;

  SubCategories({
    required this.id,
    required this.slug,
    required this.name,
    required this.banner,
    required this.icon,
    required this.numberOfChildren,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubCategories &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          slug == other.slug &&
          name == other.name &&
          banner == other.banner &&
          icon == other.icon &&
          numberOfChildren == other.numberOfChildren;

  @override
  int get hashCode =>
      id.hashCode ^
      slug.hashCode ^
      name.hashCode ^
      banner.hashCode ^
      icon.hashCode ^
      numberOfChildren.hashCode;
}
