import 'package:flutter/material.dart';
import '../../../constants/components/components.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'الإشعارات',
          style: TextStyle(
            fontFamily: 'Shamel',
          ),
        ),
        centerTitle: true,
        leading: Icon(Icons.shopping_cart),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Icon(Icons.notifications_active),
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 1.35,
              child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      buildNotificationitem(context),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 5,
                      ),
                  itemCount: 6),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
              padding: EdgeInsets.only(right: 10),
              child: defaultButton(
                text: 'حذف الكل ',
                function: () {},
                width: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNotificationitem(context) => Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
        ),
        height: 120,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'قبل يومين',
                style: TextStyle(
                  fontFamily: 'Shamel',
                  color: Colors.blue,
                  fontSize: 10,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.5,
                child: Text(
                  '.نعلمكم زبائننا الكرام أنه يوجد تحديث للتطبيق ',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: TextStyle(
                      fontFamily: 'Shamel',
                      color: Colors.blue,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Icon(
                Icons.chat_bubble_outline_sharp,
                color: Colors.blue,
              )
            ],
          ),
        ),
      );
}
