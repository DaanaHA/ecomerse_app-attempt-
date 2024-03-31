import 'package:ecommerce_app/models/category.dart';
import 'package:ecommerce_app/models/product_item_model.dart';

class CategoriesStatus {}

class CategoriesInitail extends CategoriesStatus {}

class CategoriesLoading extends CategoriesStatus {}

class CategoriesLoaded extends CategoriesStatus {
  List<Category> dummyCategories;
  List<ProductItemModel> dummyProducts;
  CategoriesLoaded(this.dummyCategories,this.dummyProducts);
}

class CategoriesError extends CategoriesStatus {
  final String errorMsg;

  CategoriesError({required this.errorMsg});
}