import 'package:flutter/material.dart';
import '../../../constants/components/components.dart';
import '../../../constants/components/icon_broken.dart';
import '../../widget/profile_header.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xF5F8F9),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileHeader(),
            Container(
              height: h * 0.53,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    settingsItem(
                        function: () {},
                        icon: IconBroken.Location,
                        iconColor: Colors.blue,
                        text: 'عناوين'),
                    settingsItem(
                        function: () {},
                        icon: IconBroken.Discount,
                        iconColor: Colors.deepPurple,
                        text: 'خصوماتي'),
                    settingsItem(
                        function: () {},
                        icon: IconBroken.Call,
                        iconColor: Colors.green,
                        text: 'تواصل معنا'),
                    settingsItem(
                        function: () {},
                        icon: IconBroken.Info_Circle,
                        iconColor: Colors.pinkAccent,
                        text: 'حول'),
                    settingsItem(
                        function: () {},
                        icon: Icons.language,
                        iconColor: Colors.orange,
                        text: 'اللغة'),
                    settingsItem(
                        function: () {},
                        icon: Icons.share,
                        iconColor: Colors.teal,
                        text: 'مشاركة التطبيق'),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 10),
              height: h * 0.04,
              child: MaterialButton(
                onPressed: () {
                  // AuthClass().signOut();
                },
                hoverElevation: 5.5,
                minWidth: 40,
                color: Colors.blue,
                child: Text(
                  'تسجيل خروج',
                  style: TextStyle(fontFamily: 'Shamel', color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildProfileItem({
    required String? text,
    required IconData? icon,
    required Color iconColor,
    required Function()? onTap,
  }) =>
      Padding(
        padding: const EdgeInsetsDirectional.only(
            start: 20, end: 20, bottom: 5, top: 5),
        child: InkWell(
          onTap: onTap,
          child: new Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              color: Colors.white,
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      text!,
                      style: TextStyle(
                          fontFamily: 'Shamel',
                          color: Colors.blue,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      icon,
                      color: iconColor,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
