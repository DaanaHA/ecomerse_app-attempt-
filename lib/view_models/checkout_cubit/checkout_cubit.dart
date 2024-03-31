import 'package:ecommerce_app/models/address_model.dart';
import 'package:ecommerce_app/models/cart_orders_model.dart';
import 'package:ecommerce_app/models/payment_method_model.dart';
import 'package:ecommerce_app/services/auth_services.dart';
import 'package:ecommerce_app/services/checkout_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutStatus> {
  CheckoutCubit() : super(CheckoutInitial());
  final _cartService = CartServiceImp();
  final _authService = AuthenticationServiceImpl();
  final _userService = UserServiceImp();
  final _homeService = HomeServiceImp();

  void uploadData() async {
    emit(CheckoutLoading());
    try {
      var orders = await _cartService.getData();
      var products = await _homeService.getData();
      final user = await _authService.currentUser();
      final users = await _userService.getData();
      final dummyUserData =
          users.firstWhere((element) => element.email == user?.email);

      emit(CheckoutSucess(orders, dummyUserData.address, products));
    } catch (e) {
      emit(CheckoutError(e.toString()));
    }
  }

  void deleteData() async {
    var products = await _homeService.getData();
    final user = await _authService.currentUser();
    final users = await _userService.getData();
    final dummyUserData =
        users.firstWhere((element) => element.email == user?.email);
    var orders = await _cartService.getData();
    orders.forEach((element) {
      _cartService.deleteData(element.id);
    });
    orders.clear();
    emit(CheckoutSucess(orders, dummyUserData.address, products));
  }
}