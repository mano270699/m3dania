import '../model/Cart_model.dart';
import '../model/user_model.dart';

import '../api/app_api.dart';
import '../model/category_model.dart';

class Repository {
  final Api api;

  Repository(this.api);
  Future<CategoryModel> getAllCategories() async {
    final category = await api.getAllCategory();

    return CategoryModel.fromJson(category);
  }

  Future<UserRegisterModel> getRegisterPhone({required String phone}) async {
    final userRegister = await api.phoneRegister(phone: phone);

    return UserRegisterModel.fromJson(userRegister);
  }

  Future<CartModel> addToCart(
      {required int productId, required int qty}) async {
    final addToCart = await api.addToCart(productId: productId, qty: qty);

    return CartModel.fromJson(addToCart);
  }

  Future<CartModel> getCart() async {
    final getCart = await api.getCart();

    return CartModel.fromJson(getCart);
  }

  Future<CartModel> delProCart({required int productId}) async {
    final delProduct = await api.delOneProCart(productId: productId);

    return CartModel.fromJson(delProduct);
  }
}
