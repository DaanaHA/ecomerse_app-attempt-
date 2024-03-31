import 'package:ecommerce_app/models/address_model.dart';
import 'package:ecommerce_app/services/firestore_services.dart';
import 'package:ecommerce_app/utils/api_paths.dart';

abstract class AdsService {
  Future<List<AddressModel>> getData();
}

class AdsServiceImp implements AdsService {
  final _firestoreService = FirestoreService.instance;
  @override
  Future<List<AddressModel>> getData() async {
    return await _firestoreService.getCollection<AddressModel>(
      path: ApiPaths.ads,
      builder: (data, documentId) => AddressModel.fromMap(data, ),
    );
  }
}