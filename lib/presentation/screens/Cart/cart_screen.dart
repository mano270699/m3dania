import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import '../../../business_logic/shared/app_cubit/app_cubit.dart';
import '../../../business_logic/shared/app_cubit/app_states.dart';
import '../../../constants/components/components.dart';
import '../../../data/model/Cart_model.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    AppCubit.get(context)..getCart();
  }

  late CartModel cartModel;
  bool isLoad = false;
  bool isEmpty = false;
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Cart'),
      ),
      body: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          if (state is GetCartSuccess) {
            if ((state).cartModel.data!.items!.length == 0) {
              cartModel = (state).cartModel;
              isLoad = true;
              isEmpty = true;
            } else {
              cartModel = (state).cartModel;
              isLoad = true;
              isEmpty = false;
            }
          }
          if (state is DelProCartSuccess) {
            if ((state).cartModels.data!.items!.length == 0) {
              isEmpty = true;
            }
          }
        },
        builder: (context, state) {
          //var cart = AppCubit.get(context).cartModels;
          return Conditional.single(
            context: context,
            conditionBuilder: (context) => isLoad,
            widgetBuilder: (context) => Conditional.single(
              context: context,
              conditionBuilder: (context) => !isEmpty,
              widgetBuilder: (context) => Column(
                children: [
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        height: h * 0.09,
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.blueGrey.shade50,
                                  blurRadius: 15,
                                  offset: Offset(1, 1))
                            ],
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("المجموع :"),
                              Text(
                                "${cartModel.data!.total} دينار ",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: h * 0.7101,
                        child: ListView.separated(
                            itemBuilder: (context, index) => buildCartItem(
                                  context,
                                  cartModel,
                                  index,
                                ),
                            separatorBuilder: (context, index) => SizedBox(
                                  height: 5,
                                ),
                            itemCount: cartModel.data!.items!.length),
                      ),
                    ],
                  ),
                  Container(
                    height: h * 0.09,
                    decoration: BoxDecoration(color: Colors.white),
                    padding: EdgeInsets.all(10),
                    child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.blueGrey.shade50,
                                blurRadius: 15,
                                offset: Offset(1, 1))
                          ],
                          color: Colors.white,
                        ),
                        child:
                            defaultButton(text: 'شراء الان ', function: () {})),
                  ),
                ],
              ),
              fallbackBuilder: (context) => Center(
                child: Container(
                  height: 150,
                  child: Image(
                    image: AssetImage('assets/images/empty_cart.png'),
                  ),
                ),
              ),
            ),
            fallbackBuilder: (context) => Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildCartItem(BuildContext context, CartModel cartModel, int index) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(10),
      height: 100,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.blue.shade100,
          blurRadius: 15,
          offset: Offset(1, 1),
        )
      ]),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${cartModel.data!.items![index].buyable!.name}",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w200),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 150,
                    child: Text(
                      "${cartModel.data!.items![index].buyable!.description}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Icon(Icons.add, color: Colors.blue.shade400),
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.blue.shade50,
                            border: Border.all(
                              color: Colors.blue.shade300,
                              width: 1,
                            )),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: Text(
                          "${cartModel.data!.items![index].quantity}",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.remove,
                          color: Colors.blue.shade400,
                        ),
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.blue.shade50,
                            border: Border.all(
                              color: Colors.blue.shade300,
                              width: 1,
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${cartModel.data!.items![index].buyable!.price}",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  AppCubit.get(context).delProCart(
                      productId:
                          int.parse('${cartModel.data!.items![index].id}'));
                },
                icon: Icon(
                  Icons.delete,
                  color: Colors.blue.shade300,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
