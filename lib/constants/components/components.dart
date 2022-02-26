// import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:easy_localization/easy_localization.dart';

void showProgressIndecator(BuildContext context) {
  AlertDialog alertDialog = AlertDialog(
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
      ),
    ),
  );
  showDialog(
      barrierColor: Colors.white.withOpacity(0),
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return alertDialog;
      });
}

Widget myDivider() => Container(
      width: double.infinity,
      height: 1,
      color: Colors.grey,
    );
Widget defaultButton({
  double width = double.infinity,
  Color color = Colors.blue,
  required String text,
  required Function()? function,
  double raidus = 0,
  double height = 40,
}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(raidus),
        color: color,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: MaterialButton(
        height: 40,
        onPressed: function,
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            fontFamily: 'Shamel',
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

Widget defaultFormText({
  required TextEditingController controller,
  IconData? suffixicon,
  required TextInputType type,
  String? lable,
  required String hint,
  bool isPassword = false,
  Function()? onTap,
  Function()? onChange,
  Function()? suffixOnPressed,
  required IconData prefixIcon,
  FormFieldValidator? validate,
  ValueChanged? onSubmit,
  Function(String? value)? onSaved,
}) =>
    TextFormField(
      keyboardType: type,
      obscureText: isPassword,
      onFieldSubmitted: onSubmit,
      controller: controller,
      validator: validate,
      onSaved: onSaved,
      decoration: InputDecoration(
          fillColor: Colors.blue[50],
          hintStyle: TextStyle(fontFamily: 'Shamel'),
          filled: true,
          labelText: lable,
          hintText: hint,
          suffixIcon: IconButton(
            onPressed: suffixOnPressed,
            icon: Icon(suffixicon),
          ),
          prefixIcon: Icon(prefixIcon)),
      onTap: onTap,
    );
// Widget CustumDiscountInput({
//    required TextEditingController controller,
//   IconData? suffixicon,
//   required TextInputType type,
//   String? lable,
//   required String hint,
//   bool isPassword = false,
//   Function()? onTap,
//   Function()? onChange,
//   Function()? suffixOnPressed,
//   required IconData prefixIcon,
//   FormFieldValidator? validate,
//   ValueChanged? onSubmit,
//   Function(String? value)? onSaved,
// }){

// }
void navigateTo(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ));
void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) => false,
    );

showToast({
  required String msg,
  Toast toastLength = Toast.LENGTH_SHORT,
  ToastGravity gravity = ToastGravity.BOTTOM,
  required Color background,
  Color textColor = Colors.white,
  fontsize = 16.0,
  timeInSecForIosWeb = 1,
}) =>
    Fluttertoast.showToast(
        msg: msg,
        toastLength: toastLength,
        gravity: gravity,
        timeInSecForIosWeb: timeInSecForIosWeb,
        backgroundColor: background,
        textColor: textColor,
        fontSize: fontsize);

Widget orDividerComponent() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 130,
          height: 1,
          color: Colors.blue,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          'App.orText'.tr(),
          style: TextStyle(fontSize: 14, color: Colors.blue),
        ),
        SizedBox(
          width: 5,
        ),
        Container(
          width: 130,
          height: 1,
          color: Colors.blue,
        ),
      ],
    );
Widget socialButton(
        {required String text, IconData? icon, Color color = Colors.white}) =>
    SignInButtonBuilder(
      text: text,
      icon: icon,
      onPressed: () {},
      backgroundColor: color,
    );

Widget settingsItem({
  required String text,
  required Color iconColor,
  required IconData icon,
  required Function() function,
}) =>
    Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20,
        end: 20,
        bottom: 5,
        top: 1.5,
      ),
      child: Container(
        color: Colors.white,
        height: 60,
        child: ListTile(
          onTap: function,
          hoverColor: iconColor,
          title: Text(
            '$text',
            style: TextStyle(
                fontFamily: 'Shamel',
                color: Colors.blue,
                fontSize: 12,
                fontWeight: FontWeight.bold),
          ),
          trailing: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: iconColor.withOpacity(.4),
                  borderRadius: BorderRadius.circular(5.0)),
              child: Icon(
                icon,
                color: iconColor,
              )),
        ),
      ),
    );

/*void basicEasyDialog(BuildContext context, {required String title}) {
  EasyDialog(
    title: Text(
      'لحد الادني للطلب 3',
      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      textScaleFactor: 1.2,
    ),
    contentList: [
      Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue[100]),
              child: IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {},
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Text(
              '3',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              width: 30,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue[100]),
              child: IconButton(
                icon: Icon(Icons.add),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    ],
  ).show(context);
}*/
// Widget buildProductItem(model, BuildContext context,
//         {bool isOldPrice = true}) =>
//     Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Container(
//         height: 120,
//         child: Row(
//           children: [
//             Stack(
//               alignment: AlignmentDirectional.bottomStart,
//               children: [
//                 Image(
//                   image: NetworkImage(
//                     model.image,
//                   ),
//                   width: 120,
//                   height: 120,
//                 ),
//                 if (model.discount != 0 && isOldPrice)
//                   Container(
//                     color: defaultColor,
//                     padding: EdgeInsets.symmetric(horizontal: 5),
//                     child: Text(
//                       'DISCOUNT',
//                       style: TextStyle(fontSize: 8, color: Colors.white),
//                     ),
//                   ),
//               ],
//             ),
//             SizedBox(
//               width: 10,
//             ),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     model.name,
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                     style: TextStyle(
//                       fontSize: 14.0,
//                       height: 1.3,
//                     ),
//                   ),
//                   Spacer(),
//                   Row(
//                     children: [
//                       Text(
//                         '${model.price}',
//                         style: TextStyle(
//                           fontSize: 12.0,
//                           color: defaultColor,
//                         ),
//                       ),
//                       SizedBox(
//                         width: 5,
//                       ),
//                       if (model.discount != 0 && isOldPrice)
//                         Text(
//                           '${model.oldPrice}',
//                           style: TextStyle(
//                               fontSize: 12.0,
//                               color: Colors.grey,
//                               decoration: TextDecoration.lineThrough),
//                         ),
//                       Spacer(),
//                       IconButton(
//                           onPressed: () {
//                             ShopCubit.get(context).changeFavorite(model.id);
//                           },
//                           icon: CircleAvatar(
//                             radius: 15.0,
//                             backgroundColor:
//                                 ShopCubit.get(context).favorite[model.id]
//                                     ? defaultColor
//                                     : Colors.grey[300],
//                             child: Icon(
//                               Icons.favorite_border,
//                             ),
//                           ))
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
