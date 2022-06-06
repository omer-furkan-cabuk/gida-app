import 'package:fit_kal/models/product.dart';
import 'package:fit_kal/services/api_services.dart';
import 'package:fit_kal/utils/app_paddings.dart';
import 'package:fit_kal/widgets/product_builder.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late List<Product>? _productModel = [];
  List<Product>? filteredProduct = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _productModel = await ApiService().getProducts();
    filteredProduct = await ApiService().getProducts();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var borderSide2 = BorderSide(
                      color: Colors.black,
                    );
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: AppPaddings().paddingMedium,
            child: TextField(
              onChanged: (value) {
                setState(() {
                  filteredProduct!.clear();
                  for (var product in _productModel!) {
                    if (product.name
                        .toLowerCase()
                        .contains(value.toLowerCase().trim())) {
                      filteredProduct!.add(product);
                    }
                  }
                });
              },
              decoration: InputDecoration(
                  isDense: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: borderSide2,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.redAccent)),
                  hintText: "Ürün Adı Giriniz"),
            ),
          ),
          _productModel == null || _productModel!.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Expanded(
                  child: ProductBuilder(
                  productModel: filteredProduct,
                )),
        ],
      ),
    );
  }
}
