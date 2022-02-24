import 'package:flutter/material.dart';
import 'package:m3dania/presentation/screens/Cart/orderDetails/finsh_order.dart';

import '../../../../constants/components/components.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F8F9),
      appBar: AppBar(
        title: Text(
          ' تنفيذ الطلب',
          style: TextStyle(
            fontFamily: 'Shamel',
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            height: 400,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('assets/images/card.png'),
                  width: 100,
                  height: 100,
                ),
                buildPaymentMethod(method: 'كاش'),
                buildPaymentMethod(method: 'أونلاين'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: defaultButton(
                raidus: 5,
                text: 'استمرار',
                function: () {
                  navigateTo(context, FinshOrder());
                }),
          ),
        ],
      ),
    );
  }

  Widget buildPaymentMethod({required String method}) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Color(0xFF198DCA)),
            color: Colors.white,
          ),
          height: 60,
          child: Center(
            child: Text(
              method,
              style: TextStyle(
                  fontFamily: 'Shamel', fontSize: 20, color: Colors.blue),
            ),
          ),
        ),
      );
}
