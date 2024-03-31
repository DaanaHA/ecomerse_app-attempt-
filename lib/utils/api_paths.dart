class ApiPaths {
  static const users = 'users/';
  static const ads = 'ads/';
  static const categories = 'categories/';
  static const products = 'products/';
  static String getProduct(String id) => 'products/$id';
  static String getUser(String id) => 'users/$id';
    static String cartItems(String id) => 'cart item/$id';
  static String getFavorite(String uid, String id) =>'users/$uid/favProducts/$id';
  static String getOrders(String uid, String id) => 'users/$uid/orders/$id';
  static String getUserFavPrefrences(String uid) => 'users/$uid/favProducts';
  static String getUserOrders(String uid) => 'users/$uid/orders';
  static String getAds(String id) => 'ads/$id';
  static String getCategories(String id) => 'categories/$id';
  static String paymentMethods(String id) => 'payment by/$id';

}