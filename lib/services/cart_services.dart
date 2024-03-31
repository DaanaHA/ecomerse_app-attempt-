import 'package:ecommerce_app/models/cart_orders_model.dart';
import 'package:ecommerce_app/services/firestore_services.dart';
import 'package:ecommerce_app/utils/api_paths.dart';
import 'package:ecommerce_app/services/auth_services.dart';
import 'package:ecommerce_app/services/user_service.dart';

abstract class CartService {
  void setData(CartOrdersModel cart);
  void deleteData(String cartId);
  Future<List<CartOrdersModel>> getData();
}

class CartServiceImp extends CartService {
  final _fireStoreService = FirestoreService.instance;
  final _authService = AuthenticationServiceImpl();
  final _userService = UserServiceImp();

  @override
  void setData(CartOrdersModel cart) async {
    var uid = await getUid();
    await _fireStoreService.setData(
        path: ApiPaths.getOrders(uid, cart.id), data: cart.toMap());
  }

  @override
  void deleteData(String cartId) async {
    var uid = await getUid();
    await _fireStoreService.deleteData(path: ApiPaths.getOrders(uid, cartId));
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

  @override
  Future<List<CartOrdersModel>> getData() async {
    var uid = await getUid();
    return await _fireStoreService.getCollection<CartOrdersModel>(
      path: ApiPaths.getUserOrders(uid),
      builder: (data, documentId) => CartOrdersModel.fromMap(data),
    );
  
  }
}