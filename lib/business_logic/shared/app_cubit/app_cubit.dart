import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/Cart_model.dart';
import '../../../presentation/screens/Cart/orderDetails/order_details_screen.dart';
import '../../../presentation/screens/Copouns/copouns_screen.dart';
import '../../../presentation/screens/MyOrders/myorder_screen.dart';
import '../../../presentation/screens/Notification/notification_screen.dart';
import '../../../presentation/screens/Profile/profile_screen.dart';

import '../../../data/model/category_model.dart';
import '../../../data/repository/app_repository.dart';
import '../../../presentation/screens/Home/home_screen.dart';
import '../../../presentation/testPage.dart';
import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit(this.repository) : super(AppStateInit());
  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  int cartItemCount = 0;

  int quantityPro = 0;

  List<Widget> screens = [
    HomeScreen(),
    CopounsScreen(),
    NotificationsScreen(),
    MyOrdersScreen(),
    ProfileScreen(),
  ];
  void changeBottomNavBar(int index) {
    currentIndex = index;
    //if (currentIndex == 1) getSports();
    // if (currentIndex == 2) getScience();
    // emit(NewsNavBottomState());
    emit(AppLayoutChangBottomNavState());
  }

  CategoryModel? category;
  final Repository repository;
  getAllCategories() {
    repository.getAllCategories().then((category) {
      this.category = category;
      emit(CategoriesLoaded(category));

      print("Done ->${category.data![1].products![1].name}");
    }).catchError((onError) {
      print(onError);
      print('on repository ');
    });
  }

  CartModel? cartModels;
  getCart() {
    emit(GetCartLoading());
    repository.getCart().then((cartModels) {
      this.cartModels = cartModels;
      cartItemCount = cartModels.data!.items!.length;
      // cartItemsCount = cartModel!.data!.items!.length;
      emit(GetCartSuccess(cartModels));
    }).catchError((onError) {
      emit(GetCartError());
      print(onError);
    });
  }

  CartModel? cartModel;

  addToCart({required int productId, required int qty}) {
    repository.addToCart(productId: productId, qty: qty).then((cartModel) {
      this.cartModel = cartModel;
      print("Done ->${cartModel.success}");
      //cartItemsCount = cartModel.data!.items!.length;
      emit(ProductAddedToCart(cartModel));
      // getCart();
//changeItemCount(counter: cartModel.data!.items!.length);
    }).catchError((onError) {
      emit(ProductErrorAddedToCart());
      print(onError);
    });
  }

  CartModel? delCartModels;
  delProCart({required int productId}) {
    repository.delProCart(productId: productId).then((delCartModels) {
      this.delCartModels = delCartModels;
      print("Data ->${delCartModels.success}");
      //print("Done ->${delCartModels.data!.items!.length}");

      emit(DelProCartSuccess(delCartModels));
      // changeItemCount(counter: delCartModels.data!.items!.length);
    }).catchError((onError) {
      emit(DelProCartError());
      print(onError);
    });
  }

  void incrementQty() {
    ++quantityPro;
    emit(ProductQtyIncremented());
  }

  void decrementQty(int minQty) {
    quantityPro = minQty;
    if (quantityPro == minQty) {
      print("sorry can not decrement");
      emit(ProductQtyErrorDecremented());
    } else {
      quantityPro--;
      emit(ProductQtyDecremented());
    }
  }
}
