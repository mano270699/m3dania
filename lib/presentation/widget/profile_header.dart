import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          height: h / 4.2,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            child: Image(
              width: double.infinity,
              image: AssetImage('assets/images/plpl.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        buildUserInfo(context)
      ],
    );
  }

  Widget buildUserInfo(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Positioned(
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
          start: 15,
          end: 15,
        ),
        child: Container(
          margin: EdgeInsets.only(top: 40),
          child: Stack(children: [
            Container(
              margin: EdgeInsets.only(top: 30),
              height: h * 0.19,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            Column(
              children: [
                Align(
                    alignment: Alignment.topCenter,
                    child: CircleAvatar(
                      radius: 40.0,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 38.0,
                        backgroundImage: AssetImage('assets/images/2.png'),
                      ),
                    )),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Ahmed mAnO",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  "01069103550",
                  style: TextStyle(
                      fontFamily: 'Shamel', color: Colors.blue, fontSize: 14),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      MaterialButton(
                        onPressed: () {},
                        height: 30,
                        minWidth: 40,
                        color: Colors.blue,
                        child: Text(
                          'App.editprofile'.tr(),
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
