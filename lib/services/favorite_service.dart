import 'package:ecommerce_app/models/product_item_model.dart';
import 'package:ecommerce_app/services/auth_services.dart';
import 'package:ecommerce_app/services/firestore_services.dart';
import 'package:ecommerce_app/services/home_services.dart';
import 'package:ecommerce_app/services/user_service.dart';
import 'package:ecommerce_app/utils/api_paths.dart';

abstract class FavoriteService {
  void setData(String id);
  void deleteData(String id);
  Future<List<ProductItemModel>> getData();
}

class FavoriteServiceImpl extends FavoriteService {
  final _fireStoreService = FirestoreService.instance;
  final _authService = AuthenticationServiceImpl();
  final _userService = UserServiceImp();
  final _homeService = HomeServicesImpl();
  @override
  void setData(String id) async {
    String uid = await getUid();
    _fireStoreService
        .setData(path: ApiPaths.getFavorite(uid, id), data: {'productId': id});
  }

  @override
  void deleteData(String id) async {
    String uid = await getUid();

    await _fireStoreService.deleteData(path: ApiPaths.getFavorite(uid, id));
  }

  @override
  Future<List<ProductItemModel>> getData() async {
    
     List<ProductItemModel> prefrencesUser = [];
    final products = await _homeService.getProducts();
    
    List<String> productIds = [];
    String uid = await getUid();
    await _fireStoreService.getCollection(
      path: ApiPaths.getUserFavPrefrences(uid),
      builder: (data, documentID) {
        // Extract productId from data and add it to productIds list
        String productId = data['productId'];
        productIds.add(productId);
      },
    );
    productIds.forEach((id) {
      products.forEach((product) {
        if (product.id == id) {
          prefrencesUser.add(product);
          
        }
      });
    });
    return prefrencesUser;
  }

  Future<String> getUid() async {
    final user = await _authService.currentUser();
    //instead of this use getCertain data to return specifc data
    final users = await _userService.getData();
    final dummyUserData =
        users.firstWhere((element) => element.email == user?.email);
    String uid = dummyUserData.id;
    return uid;
  }
}