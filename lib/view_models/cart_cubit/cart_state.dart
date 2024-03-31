import 'package:ecommerce_app/models/cart_orders_model.dart';
import 'package:ecommerce_app/models/product_item_model.dart';
import 'package:ecommerce_app/views/pages/cart_page.dart';

class CartStatus {}

class CartInitial extends CartStatus {}

class CartLoaded extends CartStatus {
  List<CartOrdersModel> shoppingItems;
  List<ProductItemModel> products;
  double totalPrice;
  CartLoaded(this.shoppingItems, this.products,this.totalPrice);
}

class CartLoading extends CartStatus {}

class CartError extends CartStatus {
  final String errorMsg;

  CartError(this.errorMsg);
}