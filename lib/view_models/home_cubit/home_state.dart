import 'package:ecommerce_app/models/product_item_model.dart';


class HomeStatus {}

class HomeInitial extends HomeStatus {}

class HomeLoading extends HomeStatus {}

class HomeLoaded extends HomeStatus {
  List<ProductItemModel> dummyProducts;
  List<ProductItemModel> favProducts;

  HomeLoaded(this.dummyProducts, this.favProducts);
}

class HomeError extends HomeStatus {
  final String errorMsg;

  HomeError({required this.errorMsg});
}