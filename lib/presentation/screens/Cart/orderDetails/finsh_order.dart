import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants/components/components.dart';

class FinshOrder extends StatelessWidget {
  const FinshOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F8F9),
      appBar: AppBar(
        title: Text(
          'تم الطلب',
          style: TextStyle(
            fontFamily: 'Shamel',
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SvgPicture.asset(
                  'assets/images/check.svg',
                  color: Colors.blue,
                  matchTextDirection: true,
                  width: 70,
                  height: 70,
                ),
                buildItemsOrders(),
                SizedBox(
                  height: 10,
                ),
                defaultButton(
                    text: 'الرجوع للرئيسية',
                    function: () {
                      //navigateAndFinish(context, OredrScreen());
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildItemsOrders() => new Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              '2021-05-6 12:02',
              style: TextStyle(
                color: Color(0xFF008FE3),
                fontFamily: 'Shamel',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('رقم الطلب',
                      style: TextStyle(
                        fontFamily: 'Shamel',
                        color: Colors.grey,
                      )),
                  Spacer(),
                  Text(
                    '#203',
                    style: TextStyle(
                        fontFamily: 'Shamel',
                        color: Color(0xFF008FE3),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            myDivider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('طريقة الدفع',
                      style: TextStyle(
                        fontFamily: 'Shamel',
                        color: Colors.grey,
                      )),
                  Spacer(),
                  Text(' كاش',
                      style: TextStyle(
                          fontFamily: 'Shamel',
                          color: Colors.blue,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            myDivider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('تفاصيل الطلب :',
                      style: TextStyle(
                        fontFamily: 'Shamel',
                        color: Colors.grey,
                      )),
                  Container(
                    height: 200,
                    child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) => buildOrderList(),
                        separatorBuilder: (context, index) => myDivider(),
                        itemCount: 5),
                  )
                ],
              ),
            ),
            myDivider(),
            Row(
              children: [
                Text(' العنوان :',
                    style: TextStyle(
                      fontFamily: 'Shamel',
                      color: Colors.grey,
                    )),
                Spacer(),
                Column(
                  children: [
                    Text('طريق المطار - جسر مادبا',
                        style: TextStyle(
                            fontFamily: 'Shamel',
                            fontSize: 12,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold)),
                    Text("شارع عمر - مبنى 15-الطابق5-الشقة10",
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Shamel',
                          color: Colors.blue,
                        )),
                  ],
                ),
              ],
            ),
            myDivider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(' وقت التوصيل :',
                      style: TextStyle(
                        fontFamily: 'Shamel',
                        color: Colors.grey,
                        fontSize: 12,
                      )),
                  Spacer(),
                  Text(' 25 اغسطس ( 12:00 AM-2:00 PM )',
                      style: TextStyle(
                          fontFamily: 'Shamel',
                          color: Colors.blue,
                          fontSize: 12,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            myDivider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('المجموع:',
                      style: TextStyle(
                        fontFamily: 'Shamel',
                        color: Colors.grey,
                        fontSize: 12,
                      )),
                  Spacer(),
                  Text(' 50.04دينار ',
                      style: TextStyle(
                          fontFamily: 'Shamel',
                          color: Colors.blue,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      );
  Widget buildOrderList() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '1- أكوافينا',
              style: TextStyle(
                  fontFamily: 'Shamel',
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'عناصر 3',
              style: TextStyle(
                  fontFamily: 'Shamel',
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "330ملم X 16",
              style: TextStyle(
                  fontFamily: 'Shamel',
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              ' 50.04دينار ',
              style: TextStyle(
                  fontFamily: 'Shamel',
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
}
