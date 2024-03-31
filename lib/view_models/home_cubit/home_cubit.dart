import 'package:ecommerce_app/models/announcement_model.dart';
import 'package:ecommerce_app/models/product_item_model.dart';
import 'package:ecommerce_app/services/home_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_app/services/auth_services.dart';
import 'package:ecommerce_app/services/favorite_service.dart';
import 'package:ecommerce_app/services/user_service.dart';
import 'package:ecommerce_app/view_models/home_cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeCubit extends Cubit<HomeStatus> {
  HomeCubit() : super(HomeInitial());
  final homeService = HomeServicesImpl();
  final favoriteService = FavoriteServiceImpl();
  final _userService = UserServiceImp();
  final _authService = AuthenticationServiceImpl();

  void getData() async {
    emit(HomeLoading());
    try {
      final products = await homeService.getProducts();

      //instead of this use getCertain data to return specifc data
      var prefrencesUser = await favoriteService.getData();
      emit(HomeLoaded(products, prefrencesUser));
    } catch (e) {
      debugPrint('error raneem $e.toString()');
      emit(HomeError(errorMsg: e.toString()));
    }
  }

  void changeFavoriteStatus(ProductItemModel newProduct) async {
   
    bool isFav = false;
   
    //get the data before edit
    var products = await homeService.getProducts();
    var prefrencesUser = await favoriteService.getData();

    prefrencesUser.forEach((product) {
      if (product.id == newProduct.id) {
        isFav = true;
      }
    });
    debugPrint('homecubit r: ${isFav.toString()}');
    if (!isFav) {
      favoriteService.setData(newProduct.id);
      //favProduct.add(newProduct);
    } else {
      //search for a product to delete it
      debugPrint('homecubit: ${newProduct.id}');
      favoriteService.deleteData(newProduct.id);
    }

//after edit
    prefrencesUser = await favoriteService.getData();

    emit(HomeLoaded(products, prefrencesUser));
  }
}