import 'package:ecommerce_app/models/category.dart';
import 'package:ecommerce_app/models/product_item_model.dart';

class FavoriteStatus {}

class FavoriteInitial extends FavoriteStatus {}

class FavoriteLoading extends FavoriteStatus {}

class FavoriteLoaded extends FavoriteStatus {
  List<ProductItemModel> favProducts;
  List<Category> dummyCategorites;
  List<ProductItemModel> dummyProducts;

  FavoriteLoaded(this.favProducts, this.dummyCategorites,this.dummyProducts);
}

class FavoriteError extends FavoriteStatus {
  final String errorMsg;

  FavoriteError({required this.errorMsg});
}