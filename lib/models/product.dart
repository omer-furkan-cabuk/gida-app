// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'product_detail.dart';

class Product {
  final String name;
  final String image;
  final int id;
  final ProductDetail productDetail;
  Product({
    required this.name,
    required this.image,
    required this.id,
    required this.productDetail,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
      'id': id,
      'productDetail': productDetail.toMap(),
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] as String,
      image: map['image'] as String,
      id: map['id'] as int,
      productDetail:
          ProductDetail.fromMap(map['productDetail'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  

  String productToJson(List<Product> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}
