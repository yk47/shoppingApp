import 'package:ecommerce/models/productModel.dart';
import 'package:ecommerce/views/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/categorycontroller.dart';

class CategoryList extends StatefulWidget {
  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  List<Categorym> categories = []; // List of categories
  ApiService apiService = ApiService();
  Future<void> _loadCategories() async {
    try {
      final List<Categorym> categoryList = await apiService.getCategories();
      setState(() {
        categories = categoryList;
      });
    } catch (e) {
      print('Error loading categories: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return ListTile(
          title: Text(category.name),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          },
        );
      },
    );
  }
}
