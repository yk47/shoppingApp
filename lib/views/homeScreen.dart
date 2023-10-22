import 'package:ecommerce/controller/categorycontroller.dart';
import 'package:ecommerce/controller/productscontroller.dart';
import 'package:ecommerce/models/category.dart';
import 'package:ecommerce/models/products.dart';

import 'package:ecommerce/views/product_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ProductsController productsController = Get.put(ProductsController());

  final bool _isSelectedList = true;
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          leading: const Padding(
            padding: EdgeInsets.only(left: 10, top: 10),
            child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/profileninja.png')),
          ),
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello,',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Text(
                'Yash Karnik',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ],
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          ],
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 10,
            ),
            Center(
              child: Container(
                height: 50,
                width: 320,
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadiusDirectional.circular(20)),
                child: const TextField(
                  decoration: InputDecoration(
                      hintText: 'Search for brand',
                      prefixIcon: Icon(CupertinoIcons.search),
                      prefixIconColor: Colors.black38,
                      hintStyle: TextStyle(color: Colors.black38),
                      border: InputBorder.none),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildProductCategory(index: 0, name: 'All Products', id: 0),
                  _buildProductCategory(index: 1, name: 'Clothes', id: 1),
                  _buildProductCategory(index: 2, name: 'Electronics', id: 2),
                  _buildProductCategory(index: 3, name: 'Furniture', id: 3),
                  _buildProductCategory(index: 4, name: 'Shoes', id: 4),
                  _buildProductCategory(index: 5, name: 'Others', id: 5),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Obx(
                () => StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    itemCount: productsController.productList.length,
                    itemBuilder: (context, index) {
                      return ProductTile(
                        product: productsController.productList[index],
                      );
                    },
                    staggeredTileBuilder: (index) =>
                        const StaggeredTile.fit(1)),
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildProductCategory(
          {required int index, required String name, required int id}) =>
      GestureDetector(
        onTap: () => setState(() {
          isSelected = index;
        }),
        child: Container(
          width: 100,
          height: 40,
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 10, left: 10),
          decoration: BoxDecoration(
            color: isSelected == index ? Colors.black : Colors.black26,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            name,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );
}
