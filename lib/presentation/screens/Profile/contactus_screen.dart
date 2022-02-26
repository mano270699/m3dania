import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../../constants/components/components.dart';

class ContactScreen extends StatelessWidget {
  ContactScreen({Key? key}) : super(key: key);
  var textTitleMessageController = TextEditingController();
  void launchUrl(String url) async {
    if (await canLaunch(url)) {
      launch(url);
    } else {
      throw "Could not launch $url";
    }
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFF5F8F9),
      appBar: AppBar(
        title: Text(
          'تواصل معنا',
          style: TextStyle(
            fontFamily: 'Shamel',
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: h * 0.2,
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new ExactAssetImage('assets/images/ourLocation.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF49C089),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: MaterialButton(
                    height: 50,
                    onPressed: () {
                      // for dial phone number
                      launchUrl("tel:+99364921507");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '99364921507',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Shamel'),
                        ),
                        Icon(
                          Icons.phone,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF5685E2),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: MaterialButton(
                    height: 50,
                    onPressed: () {
                      //for launching url
                      launchUrl("https://www.facebook.com/");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'تواصل معنا عبر فيسبوك',
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Shamel'),
                        ),
                        Spacer(),
                        Icon(
                          Icons.whatsapp,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFDA489B),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: MaterialButton(
                    height: 50,
                    onPressed: () {
                      launchUrl('https://www.instagram.com/');
                    },
                    child: Row(
                      children: [
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  'تواصل معنا عبر انستقرام',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Shamel'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.inbox,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10, bottom: 5),
                child: defaultFormText(
                    controller: textTitleMessageController,
                    type: TextInputType.text,
                    hint: 'موضوع الرسالة',
                    prefixIcon: Icons.message),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10, bottom: 5),
                child: TextFormField(
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: 'أكتب الرسالة ...',
                      contentPadding: new EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      fillColor: Colors.white,
                      hintStyle: TextStyle(fontFamily: 'Shamel'),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 12,
                  left: 10,
                  right: 10,
                ),
                child:
                    defaultButton(text: ' إرسال', function: () {}, height: 40),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
