import 'package:ecommerce_app/services/cart_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:ecommerce_app/models/cart_orders_model.dart';
import 'package:ecommerce_app/services/cart_services.dart';
import 'package:ecommerce_app/services/home_services.dart';
import 'package:ecommerce_app/view_models/cart_cubit/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//part 'cart_state.dart';

class CartCubit extends Cubit<CartStatus> {
  CartCubit() : super(CartInitial());
  final homeService = HomeServicesImpl();
  final cartService = CartServiceImp();

  void getData() async {
    emit(CartLoading());
    try {
      var products = await homeService.getProducts();
      var orders = await cartService.getData();
      double totalPrice=0;
      orders.forEach((order)=>totalPrice+=order.totalPrice);
      emit(CartLoaded(orders, products,totalPrice));
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  void deleteOrder(String cartId) async {
     cartService.deleteData(cartId);
     var products = await homeService.getProducts();
      var orders = await cartService.getData();
      double totalPrice=0;
      orders.forEach((order)=>totalPrice+=order.totalPrice); 
      emit(CartLoaded(orders, products,totalPrice));
  }
}