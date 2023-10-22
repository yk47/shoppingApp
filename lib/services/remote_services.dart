import 'package:ecommerce/models/products.dart';
import 'package:http/http.dart' as http;

import '../models/categoryModel.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<List<Products>> fetchProducts() async {
    var response =
        await client.get(Uri.parse('https://api.escuelajs.co/api/v1/products'));

    if (response.statusCode == 200) {
      var jsonString = response.body;

      return productsFromJson(jsonString);
    } else {
      throw Exception('Failed to load products');
    }
  }

  // static Future<List<CategoryModel>> fetchCategory(int categoryId) async {
  //   var responseCategory = await client.get(Uri.parse(
  //       'https://api.escuelajs.co/api/v1/categories/$categoryId/products'));

  //   if (responseCategory.statusCode == 200) {
  //     var jsonString1 = responseCategory.body;
  //     print(jsonString1);
  //     return categoryModelFromJson(jsonString1);
  //   } else {
  //     throw Exception('Failed to load products');
  //   }
  // }
}
