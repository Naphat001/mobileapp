class Product {
  final String id;
  final String name;
  final String sku;
  final double price;
  final String imageUrl;
  final String description;
  final bool isNew;
  final String category;

  Product({
    required this.id,
    required this.name,
    required this.sku,
    required this.price,
    required this.imageUrl,
    required this.description,
    this.isNew = false,
    this.category = 'General',
  });
}
