import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:m3dania/constants/components/components.dart';
import 'package:m3dania/presentation/screens/address/add_address.dart';

class AllAddresses extends StatelessWidget {
  const AllAddresses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('App.addressTitlePage'.tr())),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildAddress(context,
                addressName: 'بيت جدي',
                cityName: 'طريق المطار - جسر مادبا',
                detailsAddress: 'شارع عمر - مبنى 15 الطابق-5 الشقة 10')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            navigateTo(context, AddNewAddress());
          }),
    );
  }

  Widget buildAddress(
    BuildContext context, {
    required String addressName,
    required String cityName,
    required String detailsAddress,
  }) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: h * 0.2,
        width: w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  addressName,
                  style: TextStyle(
                    color: Color(0xFF008FE3),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Shamel',
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          cityName,
                          style: TextStyle(
                            color: Color(0xFF008FE3),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Shamel',
                          ),
                        ),
                        Text(
                          detailsAddress,
                          style: TextStyle(
                            color: Color(0xFF7C8E9E),
                            fontSize: 12,
                            fontFamily: 'Shamel',
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {},
                              color: Color(0xFF7C8E9E),
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {},
                              color: Color(0xFF7C8E9E),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
