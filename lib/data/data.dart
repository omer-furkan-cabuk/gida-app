import 'package:fit_kal/models/product.dart';

class Data {
  static List favoriteProducts = [1, 2, 3];

  static void updateProduct(Product product) {
    int id = product.id;
    if (!favoriteProducts.contains(id)) {
      favoriteProducts.add(id);
    } else if (favoriteProducts.contains(id)) {
      favoriteProducts.remove(id);
    }
  }
}
