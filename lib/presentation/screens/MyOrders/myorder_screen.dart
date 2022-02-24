import 'package:flutter/material.dart';
import '../../../constants/components/components.dart';
import '../../../constants/components/icon_broken.dart';
import 'package:easy_localization/easy_localization.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  _MyOrdersScreenState createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  int _selectedIndex = 0;
  Color selectColorFirstB = Colors.blue;
  Color selectColorSecondB = Colors.white;
  Color selectColortherdB = Colors.white;
  Color textColor1 = Colors.white;
  Color textColor2 = Colors.black;
  Color textColor3 = Colors.black;
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xF5F8F9),
      appBar: AppBar(
        title: Text(
          'App.myorder'.tr(),
          style: TextStyle(
            fontFamily: 'Shamel',
          ),
        ),
        centerTitle: true,
        leading: Icon(IconBroken.Buy),
        actions: [
          IconButton(
            icon: Icon(IconBroken.Notification),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 10,
              child: ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  defaultButton(
                      textColor: textColor1,
                      text: 'App.new'.tr(),
                      function: () {
                        setState(() {
                          _selectedIndex = 0;
                          selectColorFirstB = Color(0xFF008FE3);

                          selectColorSecondB = Colors.white;
                          selectColortherdB = Colors.white;
                          textColor3 = Color(0xFF008FE3);
                          textColor2 = Color(0xFF008FE3);
                          textColor1 = Colors.white;
                        });
                        _pageController!.animateToPage(0,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease);
                      },
                      width: 100,
                      color: selectColorFirstB),
                  defaultButton(
                      textColor: textColor2,
                      text: 'App.Delivery'.tr(),
                      function: () {
                        setState(() {
                          _selectedIndex = 1;
                          selectColorFirstB = Colors.white;
                          selectColorSecondB = Color(0xFF008FE3);
                          selectColortherdB = Colors.white;
                          textColor1 = Color(0xFF008FE3);
                          textColor3 = Color(0xFF008FE3);
                          textColor2 = Colors.white;
                        });
                        _pageController!.animateToPage(1,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease);
                      },
                      width: 100,
                      color: selectColorSecondB),
                  defaultButton(
                      text: 'App.delivered'.tr(),
                      textColor: textColor3,
                      function: () {
                        setState(() {
                          _selectedIndex = 2;
                          selectColorFirstB = Colors.white;
                          selectColorSecondB = Colors.white;
                          selectColortherdB = Color(0xFF008FE3);
                          textColor1 = Color(0xFF008FE3);
                          textColor2 = Color(0xFF008FE3);
                          textColor3 = Colors.white;
                        });
                        _pageController!.animateToPage(2,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease);
                      },
                      width: 100,
                      color: selectColortherdB),
                ],
              ),
            ),
            Expanded(
              flex: 85,
              child: PageView(
                controller: _pageController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: buildItemPageOne(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: buildItemPageTwo(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: buildItemPageThree(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildItemPageOne() => ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) => buildCardItem(),
      separatorBuilder: (context, index) => SizedBox(
            height: 10,
          ),
      itemCount: 3);
  Widget buildItemPageTwo() => ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) => buildCardItem(),
      separatorBuilder: (context, index) => SizedBox(
            height: 10,
          ),
      itemCount: 3);
  Widget buildItemPageThree() => ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) => buildCardItem(),
      separatorBuilder: (context, index) => SizedBox(
            height: 10,
          ),
      itemCount: 3);
  Widget buildCardItem() => Container(
        child: Card(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.delete),
                ),
                SizedBox(
                  width: 50,
                ),
                Text(
                  '2021-05-6 12:02',
                  style:
                      TextStyle(fontFamily: 'Shamel', color: Color(0xFF008FE3)),
                ),
              ],
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
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(' العنوان :',
                      style: TextStyle(
                        fontFamily: 'Shamel',
                        fontSize: 14,
                        color: Colors.grey,
                      )),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: Column(
                      children: [
                        Text('طريق المطار - جسر مادبا',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: 'Shamel',
                              color: Colors.blue,
                              fontSize: 12,
                            )),
                        Text("شارع عمر - مبنى 15-الطابق5-الشقة10",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: 'Shamel',
                              color: Colors.blue,
                              fontSize: 12,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            myDivider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(' وقت التوصيل :',
                        style: TextStyle(
                          fontFamily: 'Shamel',
                          color: Colors.grey,
                        )),
                    Container(
                      child: Text(' 25 اغسطس (12:00 AM-2:00 PM)',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Shamel',
                            color: Colors.blue,
                          )),
                    ),
                  ],
                ),
              ),
            ),
            myDivider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('المجموع:',
                      style: TextStyle(
                        fontFamily: 'Shamel',
                        color: Colors.grey,
                      )),
                  Text(' 50.04دينار ',
                      style: TextStyle(
                          fontFamily: 'Shamel',
                          color: Colors.blue,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            defaultButton(
              text: 'اتصل بالسائق',
              function: () {},
              width: 320,
            ),
          ]),
          color: Colors.white,
        ),
      );
  Widget defaultButton({
    double width = double.infinity,
    Color color = Colors.blue,
    required String text,
    required Function()? function,
    Color textColor = Colors.white,
  }) =>
      Container(
        width: width,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: color,
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: MaterialButton(
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.blue[100]!, width: 2)),
          height: 40,
          onPressed: function,
          child: Text(
            text.toUpperCase(),
            style: TextStyle(
              fontFamily: 'Shamel',
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
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
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "330ملم X 16",
              style: TextStyle(
                  fontFamily: 'Shamel',
                  color: Colors.blue,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "عناصر 3",
              style: TextStyle(
                  fontFamily: 'Shamel',
                  color: Colors.blue,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              ' 50.04دينار ',
              style: TextStyle(
                  fontFamily: 'Shamel',
                  color: Colors.blue,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
}
