import 'dart:convert';

class Product {
    num id;
    String name;
    String image;
    double price;
    String description;
    String color;

  Product(this.id,this.name,this.image,this.price,this.description,this.color,);

  Product copyWith({
    num? id,
    String? name,
    String? image,
    double? price,
    String? description,
    String? color,
  }) {
    return Product(
      id ?? this.id,
      name ?? this.name,
      image ?? this.image,
      price ?? this.price,
      description ?? this.description,
      color ?? this.color,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'price': price,
      'description': description,
      'color': color,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      map['id'] ?? 0,
      map['name'] ?? '',
      map['image'] ?? '',
      map['price']?.toDouble() ?? 0.0,
      map['description'] ?? '',
      map['color'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(id: $id, name: $name, image: $image, price: $price, description: $description, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Product &&
      other.id == id &&
      other.name == name &&
      other.image == image &&
      other.price == price &&
      other.description == description &&
      other.color == color;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      image.hashCode ^
      price.hashCode ^
      description.hashCode ^
      color.hashCode;
  }
}


class CategoryModal {
  static late  List<Product> products;
}
