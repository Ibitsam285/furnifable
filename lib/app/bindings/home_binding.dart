import 'package:get/get.dart';
import 'package:furnifable/app/controllers/cart_controller.dart';
import 'package:furnifable/app/controllers/favorite_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..put<FavoriteController>(FavoriteController())
      ..put<CartController>(CartController());
  }
}
