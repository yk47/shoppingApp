// category_model.dart
class Categorym {
  final int id;
  final String name;
  Categorym({required this.id, required this.name});
}

// product_model.dart
class Productm {
  final int id;
  final String name;
  final int categoryId;
  Productm({required this.id, required this.name, required this.categoryId});
}
