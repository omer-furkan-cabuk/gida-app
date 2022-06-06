import 'package:fit_kal/models/product.dart';
import 'package:fit_kal/models/product_detail.dart';
import 'package:fit_kal/views/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    return MaterialApp(
      home: MainPage(),
      debugShowCheckedModeBanner: false,
      

    );
  }
}

Product product_1 = Product(
    name: "Coca Cola",
    image:"https://www.mismarsanalmarket.com/UserFiles/Fotograflar/org/813-8690624200492-jpg-8690624200492.jpg",
    id: 1,
    productDetail: ProductDetail(
        calories: "500",
        carbohydrate: "0",
        fat: "0",
        fiber: "0",
        protein: "0",
        sugar: "832638346262482648",
        gram: "110 g"));
