import 'package:ecommerce/models/products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/productscontroller.dart';

class SingleprosuctScreen extends StatelessWidget {
  final ProductsController productsController = Get.put(ProductsController());
  final Products product;
  final String imgUrl;
  final String title;
  final String description;
  final int price;
  SingleprosuctScreen(
      {super.key,
      required this.imgUrl,
      required this.title,
      required this.description,
      required this.price,
      required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border_outlined))
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(child: Image.network(imgUrl)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  child: Text(
                    title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    '₹ ${price.toString()}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                description,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Buy Now',
                    style: TextStyle(),
                  )),
            )
            // Stack(
            //   children: [
            //     ListView.separated(
            //       scrollDirection: Axis.horizontal,
            //       itemBuilder: (context, index) {
            //         return ListTile(
            //           leading: Image.network(product.images[1]),
            //         );
            //       },
            //       separatorBuilder: (context, index) => const SizedBox(
            //         width: 8,
            //       ),
            //       itemCount: productsController.productList.length.bitLength,
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
