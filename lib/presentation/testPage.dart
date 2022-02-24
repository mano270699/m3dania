import 'package:flutter/material.dart';
import '../constants/components/shammer.dart';
import '../constants/network/local/cache_helper.dart';
import '../constants/strings.dart';

class Tester extends StatelessWidget {
  const Tester({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: IconButton(
          icon: Icon(Icons.logout),
          onPressed: () {
            CacheHelper.removeData(key: 'token');
            Navigator.pushReplacementNamed(context, loginScreen);
          },
        ),
      ),
    );
  }
}
