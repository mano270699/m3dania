import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../business_logic/shared/app_cubit/app_cubit.dart';
import '../../business_logic/shared/app_cubit/app_states.dart';
import '../../constants/components/components.dart';
import '../../constants/network/local/cache_helper.dart';
import '../screens/login/login_screen.dart';

class CustomAlertDialog extends StatefulWidget {
  CustomAlertDialog({
    Key? key,
    required this.minQty,
    required this.prodectID,
  }) : super(key: key);

  String minQty = '';
  int prodectID;

  @override
  _CustomAlertDialogState createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Color(0xffffffff),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          if (state is ProductQtyErrorDecremented)
            showToast(msg: 'App.decrementError'.tr(), background: Colors.red);
        },
        builder: (context, state) {
          //  AppCubit.get(context).quantityPro = int.parse(widget.minQty);
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "App.dialogTitle".tr() + '${widget.minQty}',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  IconButton(
                    icon: SvgPicture.asset('assets/images/Group672.svg',
                        width: 14, height: 16, color: Colors.blue),
                    onPressed: () {
                      AppCubit.get(context).quantityPro = 0;
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
              SizedBox(height: 10),
              Divider(
                height: 1,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.blue),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: IconButton(
                        onPressed: () {
                          AppCubit.get(context)
                              .decrementQty(int.parse(widget.minQty));
                        },
                        icon: Icon(
                          Icons.remove,
                          color: Colors.blue,
                        )),
                  ),
                  Text(
                    AppCubit.get(context).quantityPro == 0
                        ? '${widget.minQty}'
                        : '${AppCubit.get(context).quantityPro}',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Shamel',
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.blue),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: IconButton(
                        onPressed: () {
                          if (AppCubit.get(context).quantityPro == 0) {
                            AppCubit.get(context).quantityPro =
                                int.parse(widget.minQty);
                          }
                          AppCubit.get(context).incrementQty();
                        },
                        icon: Icon(
                          Icons.add,
                          color: Colors.blue,
                        )),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: InkWell(
                  highlightColor: Colors.grey[200],
                  onTap: () {
                    var token = CacheHelper.getData(key: 'token');
                    if (token == null) {
                      print("no token : $token");
                      Navigator.of(context).pop();
                      navigateAndFinish(context, LoginScreen());
                    } else {
                      print(" token : $token");
                      print(" prodectID : ${widget.prodectID}");

                      AppCubit.get(context).addToCart(
                          productId: widget.prodectID,
                          qty: AppCubit.get(context).quantityPro == 0
                              ? int.parse(widget.minQty)
                              : AppCubit.get(context).quantityPro);

                      AppCubit.get(context).quantityPro = 0;

                      Navigator.of(context).pop();
                      //do somethig
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'App.addedToCart'.tr(),
                                style: TextStyle(color: Colors.white),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // AppCubit.get(context).getCart();
                                  // Navigator.pushNamed(context, cartPage);
                                },
                                child: Text(
                                  'App.goToCart'.tr(),
                                  style: TextStyle(color: Colors.green),
                                ),
                              ),
                            ],
                          ),
                          backgroundColor: Colors.black,
                          duration: Duration(seconds: 3),
                        ),
                      );
                    }
                  },
                  child: Center(
                    child: Text(
                      "App.continue".tr(),
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
