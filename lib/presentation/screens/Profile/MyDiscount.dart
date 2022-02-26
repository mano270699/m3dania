import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class MyDiscount extends StatelessWidget {
  const MyDiscount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App.myDiscount'.tr()),
      ),
      body: Center(
          child: Text(
        'Comming soon',
        style: TextStyle(
          color: Colors.blue,
          fontSize: 18,
          fontFamily: 'Shamel',
          fontWeight: FontWeight.bold,
        ),
      )),
    );
  }
}
