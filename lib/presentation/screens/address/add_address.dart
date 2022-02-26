import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../constants/components/components.dart';

class AddNewAddress extends StatelessWidget {
  const AddNewAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('App.newAddressTitle'.tr()),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.01),
        height: h,
        width: w,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              height: h * 0.2,
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new ExactAssetImage('assets/images/location.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: h * 0.04,
            ),
            buildPromoInput(context, 'App.AddressName'.tr()),
            buildPromoInput(context, 'App.shippingCity'.tr()),
            buildPromoInput(context, 'App.shippingRegion'.tr()),
            buildPromoInput(context, 'App.shippingStreat'.tr()),
            buildPromoInput(context, 'App.shippingNo'.tr()),
            buildPromoInput(context, 'App.shippingNoFlat'.tr()),
            SizedBox(
              height: h * 0.05,
            ),
            defaultButton(
                raidus: 5,
                text: 'App.checkOut'.tr(),
                function: () {
                  // navigateTo(context, PaymentMethod());
                }),
          ]),
        ),
      ),
    );
  }

  Widget buildPromoInput(BuildContext context, String textHint) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: textHint,
          hintStyle: TextStyle(
            color: Color(0xFF008FE3),
            fontFamily: 'Shamel',
            fontSize: 12,
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
              color: Color(0xFF008FE3),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
              color: Color(0xFF008FE3),
              width: 1.0,
            ),
          ),
        ),
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a speciality';
          }
          return null;
        },
        onChanged: (value) {
          // (_speciality = value);
        },
      ),
    );
  }
}
