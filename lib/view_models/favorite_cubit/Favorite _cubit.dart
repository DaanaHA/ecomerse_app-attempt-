import 'package:ecommerce_app/models/user.dart';
import 'package:ecommerce_app/models/product_item_model.dart';
import 'package:ecommerce_app/services/auth_services.dart';
import 'package:ecommerce_app/services/cart_services.dart';
import 'package:ecommerce_app/services/category_service.dart';
import 'package:ecommerce_app/services/favorite_service.dart';
import 'package:ecommerce_app/view_models/favorite_cubit/favorite_state.dart';
import 'package:ecommerce_app/services/home_services.dart';
import 'package:ecommerce_app/services/user_service.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteCubit extends Cubit<FavoriteStatus> {
  FavoriteCubit() : super(FavoriteInitial());

  final _homeService = HomeServicesImpl();
  final _categoryService = CategoryServiceImpl();
  final _authService = AuthenticationServiceImpl();
  final _userService = UserServiceImp();
  final favoriteService = FavoriteServiceImpl();

  void getData() async {
    emit(FavoriteLoading());
    try {
       

      final products = await _homeService.getProducts();
      final categories = await _categoryService.getData();
     
      var prefrencesUser = await favoriteService.getData();

      emit(FavoriteLoaded(prefrencesUser, categories, products));
    } catch (e) {
      emit(FavoriteError(errorMsg: e.toString()));
    }
  }

  void changeFavoriteStatus(ProductItemModel newProduct) async {
    final products = await _homeService.getProducts();
    
    //remove from favProducts and update the value
     favoriteService.deleteData(newProduct.id);

    var prefrencesUser = await favoriteService.getData();
  
  

    final categories = await _categoryService.getData();
    emit(FavoriteLoaded(prefrencesUser, categories, products));
  }
}