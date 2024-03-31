import 'package:ecommerce_app/models/cart_orders_model.dart';
import 'package:ecommerce_app/models/product_item_model.dart';
import 'package:ecommerce_app/models/category.dart';
import 'package:ecommerce_app/models/product_item_model.dart';

class CheckoutStatus {}

class CheckoutInitial extends CheckoutStatus {}

class CheckoutLoading extends CheckoutStatus {}

class CheckoutSucess extends CheckoutStatus {
  List<CartOrdersModel> shoppingItems;
  List<ProductItemModel> products;
  String address;
  CheckoutSucess(this.shoppingItems,this.address,this.products);
}

class CheckoutError extends CheckoutStatus {
  String message;
  CheckoutError(this.message);
}