import 'package:fit_kal/data/data.dart';
import 'package:fit_kal/models/product.dart';
import 'package:fit_kal/services/api_services.dart';
import 'package:fit_kal/widgets/product_builder.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late List<Product>? _productModel = [];
  late List<Product>? favoritesProduct = [];

  List favoritesId = Data.favoriteProducts;
  @override
  void initState() {
    super.initState();
    _getData();
    //getFavorites();
  }

  void _getData() async {
    _productModel = await ApiService().getProducts();

    for (var product in _productModel!) {
      if (favoritesId.contains(product.id)) {
        favoritesProduct!.add(product);
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: favoritesProduct == null || favoritesProduct!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ProductBuilder(
              productModel: favoritesProduct,
            ),
    );
  }

  /*  Future getFavorites() async {
    await Future.delayed(const Duration(milliseconds : 1000));
    final SharedPreferences pref = await SharedPreferences.getInstance();

    final favoritesString = pref.getString(PreferencesKeys.favorites.toString()) ?? '';

    print(favoritesString);

  } */

}
