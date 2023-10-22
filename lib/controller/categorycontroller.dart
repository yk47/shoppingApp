// api_services.dart
import 'dart:convert';
import 'package:ecommerce/models/productModel.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://api.escuelajs.co/api/v1';

  Future<List<Categorym>> getCategories() async {
    final response = await http.get(Uri.parse('$baseUrl/categories'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data
          .map((item) => Categorym(id: item['id'], name: item['name']))
          .toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  Future<List<Productm>> getProductsByCategory(int categoryId) async {
    final response =
        await http.get(Uri.parse('$baseUrl/categories/$categoryId/products'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data
          .map((item) => Productm(
              id: item['id'],
              name: item['name'],
              categoryId: item['categoryId']))
          .toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
