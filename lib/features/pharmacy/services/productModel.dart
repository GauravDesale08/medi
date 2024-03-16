class Product {
  final String name;
  final String pcs;
  final String price;
  final String imageUrl;

  Product({
    required this.name,
    required this.pcs,
    required this.price,
    required this.imageUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      pcs: json['pcs'],
      price: json['price'],
      imageUrl: json['imageUrl'],
    );
  }
}
