import 'package:fit_kal/models/product.dart';
import 'package:fit_kal/services/api_services.dart';
import 'package:fit_kal/widgets/product_builder.dart';
import 'package:fit_kal/widgets/product_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Product>? _productModel = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _productModel = await ApiService().getProducts();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: _productModel == null || _productModel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ProductBuilder(productModel: _productModel,),
    );

  }

 
  
}
