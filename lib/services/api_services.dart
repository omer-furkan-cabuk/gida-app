import 'dart:convert';

import 'package:fit_kal/constants.dart';
import 'package:fit_kal/models/product.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Product>?> getProducts() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.productsEndpoint);
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
        return parsed.map<Product>((json) => Product.fromMap(json)).toList();
      } else {
        throw Exception('Data Sorun ');
      }
    } catch (e) {
      //print(e.toString());
    }
  }

  Future<List<Product>?> getProductbyId(List<int> favoriteProductOfId) async {
    List<Product> listOfFavorites = [];
    try {
      for (int i in favoriteProductOfId) {
        var url = Uri.parse(ApiConstants().idToProductUrl(i));

        final response = await http.get(url);
        if (response.statusCode == 200) {
          final parsed =
              json.decode(response.body).cast<Map<String, dynamic>>();
              var urun = Product.fromMap(parsed);
              print(parsed);
          listOfFavorites.add(urun);
        } else {
          throw Exception('Data Sorun ');
        }
        
      }
      print("here");
      print(listOfFavorites);
      return listOfFavorites;
      
    } catch (e) {
      //print(e.toString());
    }
  }
}
