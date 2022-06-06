class ApiConstants {
  static const baseUrl = "https://fit-lab-c3afd-default-rtdb.firebaseio.com";
  static const String productsEndpoint = '/products.json';

  String idToProductUrl(int i) {
    return baseUrl + "/products/$i.json";
  }
}
