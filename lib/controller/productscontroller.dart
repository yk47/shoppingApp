import 'package:ecommerce/models/products.dart';
import 'package:ecommerce/services/remote_services.dart';
import 'package:get/state_manager.dart';

class ProductsController extends GetxController {
  RxList<Products> productList = <Products>[].obs;
  RxList<Category> categoryList = <Category>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    var products = await RemoteServices.fetchProducts();

    productList.value = products;
  }
}
