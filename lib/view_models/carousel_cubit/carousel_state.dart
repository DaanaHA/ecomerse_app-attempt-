import 'package:ecommerce_app/models/address_model.dart';

class CarouselState {}

class CarouselInitial extends CarouselState {}

class CarouselLoading extends CarouselState {}

class CarouselLoaded extends CarouselState {
  final List<AddressModel> ads;
  CarouselLoaded(this.ads);
}

class CarouselFaliure extends CarouselState {
  final String msg;

  CarouselFaliure(this.msg);
}