import 'dart:convert';

class Product {
  final String? id;
  final String name;
  final String description;
  final double quantity;
  final String category;
  final List<String> images;
  final double price;

  Product({
    this.id,
    required this.name,
    required this.description,
    required this.quantity,
    required this.category,
    required this.images,
    required this.price,
  });

  Product copyWith({
    String? id,
    String? name,
    String? description,
    double? quantity,
    String? category,
    List<String>? images,
    double? price,
    String? userId,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      quantity: quantity ?? this.quantity,
      category: category ?? this.category,
      images: images ?? this.images,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'quantity': quantity,
      'category': category,
      'images': images,
      'price': price,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['_id'] != null ? map['_id'] as String : null,
      name: map['name'] as String,
      description: map['description'] as String,
      quantity: (map['quantity'] as num).toDouble(),
      category: map['category'] as String,
      price: (map['price'] as num).toDouble(),
      images: List<String>.from((map['images'])),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
