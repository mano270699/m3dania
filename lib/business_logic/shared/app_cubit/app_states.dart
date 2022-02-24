import '../../../data/model/Cart_model.dart';

import '../../../data/model/category_model.dart';

abstract class AppStates {}

class AppStateInit extends AppStates {}

class AppStateLoading extends AppStates {}

class AppStateSuccess extends AppStates {}

class AppStateError extends AppStates {
  var error;
  AppStateError(this.error);
}

class AppLayoutChangBottomNavState extends AppStates {}

class CategoriesLoaded extends AppStates {
  final CategoryModel category;

  CategoriesLoaded(this.category);
}

class ProductQtyIncremented extends AppStates {}

class ProductQtyDecremented extends AppStates {}

class ProductQtyErrorDecremented extends AppStates {}

class ProductAddedToCart extends AppStates {
  final CartModel cartModels;

  ProductAddedToCart(this.cartModels);
}

class ProductErrorAddedToCart extends AppStates {}

class GetCartLoading extends AppStates {}

class GetCartSuccess extends AppStates {
  final CartModel cartModel;

  GetCartSuccess(this.cartModel);
}

class GetCartError extends AppStates {}

class DelProCartSuccess extends AppStates {
  final CartModel cartModels;

  DelProCartSuccess(this.cartModels);
}

class DelProCartError extends AppStates {}

class ItemCartCounterChanged extends AppStates {}
