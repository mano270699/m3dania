import 'package:flutter/material.dart';

class CopounsScreen extends StatelessWidget {
  const CopounsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
