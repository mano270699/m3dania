import 'package:flutter/material.dart';

class CopounsScreen extends StatelessWidget {
  const CopounsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Soon...',
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'Shamel',
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            Icon(
              Icons.local_offer,
              size: 20,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
