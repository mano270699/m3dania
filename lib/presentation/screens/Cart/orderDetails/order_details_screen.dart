import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:m3dania/constants/components/components.dart';
import 'package:m3dania/presentation/screens/Cart/orderDetails/payment_Method.dart';
import 'package:m3dania/presentation/screens/Cart/orderDetails/select_deliveryTime.dart';

class OrderDetails extends StatelessWidget {
  OrderDetails({Key? key}) : super(key: key);
  var codeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("App.shippingAddressDetails".tr()),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: defaultButton(
                  raidus: 5, text: 'App.newAddress'.tr(), function: () {}),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: h * 0.3,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'App.shippingAddress'.tr(),
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Shamel'),
                      ),
                      Container(
                        height: h * 0.25,
                        child: ListView.separated(
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) =>
                                buildAddress(context),
                            separatorBuilder: (context, index) => myDivider(),
                            itemCount: 4),
                      ),
                    ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: defaultButton(
                  raidus: 5,
                  text: 'App.delivaryTime'.tr(),
                  function: () {
                    // Navigator.pushNamed(context, );
                    navigateTo(context, DateTimeScreen());
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: buildPromoInput(context),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: buildTotalOredr(context),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: defaultButton(
                  raidus: 5,
                  text: 'App.checkOut'.tr(),
                  function: () {
                    navigateTo(context, PaymentMethod());
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAddress(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: (() {}),
      child: Container(
        height: h * 0.08,
        width: w,
        padding: EdgeInsets.symmetric(horizontal: 10),
        color: Colors.white,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Cairo-Egypt',
                style: TextStyle(
                    color: Color(0xFF008FE3),
                    fontSize: 14,
                    fontFamily: 'Shamel'),
              ),
              Text(
                'Cairo 16 street 15 building 5 float ',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Color(0xFF7C8E9E),
                    fontSize: 12,
                    fontFamily: 'Shamel'),
              ),
            ]),
      ),
    );
  }

  Widget buildPromoInput(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'App.discounthintTxt'.tr(),
                hintStyle: TextStyle(
                  color: Color(0xFF008FE3),
                  fontFamily: 'Shamel',
                  fontSize: 12,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
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
                    width: 2.0,
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
          ),
          Expanded(
            flex: 1,
            child: MaterialButton(
              height: h * 0.065,
              minWidth: w * 0.04,
              color: Colors.blue,
              onPressed: () {},
              child: Text(
                'App.discountBtnTxt'.tr(),
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Shamel',
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTotalOredr(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      height: h * 0.2,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildRowTotal(title: "App.subTotal".tr(), price: "15 JOD"),
          myDivider(),
          buildRowTotal(title: "App.disc".tr(), price: "2 JOD"),
          myDivider(),
          buildRowTotal(title: 'App.total'.tr(), price: "12 JOD"),
        ],
      ),
    );
  }

  Widget buildRowTotal({required String title, required String price}) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: Color(0xFF7C8E9E), fontSize: 12, fontFamily: 'Shamel'),
            ),
            Text(
              price,
              style: TextStyle(
                  color: Color(0xFF008FE3),
                  fontSize: 12,
                  fontFamily: 'Shamel',
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
}
