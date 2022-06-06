// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductDetail {
 
  
  
  String calories;
  String carbohydrate;
  String fat;
  String fiber;
  String protein;
  String sugar;
  String gram;
  ProductDetail({
    required this.calories,
    required this.carbohydrate,
    required this.fat,
    required this.fiber,
    required this.protein,
    required this.sugar,
    required this.gram,
  });

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'calories': calories,
      'carbohydrate': carbohydrate,
      'fat': fat,
      'fiber': fiber,
      'protein': protein,
      'sugar': sugar,
      'gram': gram,
    };
  }

  factory ProductDetail.fromMap(Map<String, dynamic> map) {
    return ProductDetail(
      calories: map['calories'] as String,
      carbohydrate: map['carbohydrate'] as String,
      fat: map['fat'] as String,
      fiber: map['fiber'] as String,
      protein: map['protein'] as String,
      sugar: map['sugar'] as String,
      gram: map['gram'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductDetail.fromJson(String source) => ProductDetail.fromMap(json.decode(source) as Map<String, dynamic>);
}
