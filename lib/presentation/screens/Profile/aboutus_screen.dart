// import 'package:emaie/modules/Cart/cart_screen.dart';
// import 'package:emaie/shared/components/components.dart';
// import 'package:flutter/material.dart';
// import 'package:hexcolor/hexcolor.dart';

// class AboutUsScreen extends StatelessWidget {
//   const AboutUsScreen({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return new Directionality(
//         textDirection: TextDirection.rtl,
//         child: Scaffold(
//           backgroundColor: HexColor('#F5F8F9'),
//           appBar: AppBar(
//             centerTitle: true,
//             title: Text(
//               'من نحن',
//               style: TextStyle(
//                 fontFamily: 'Shamel',
//               ),
//             ),
//             actions: [
//               IconButton(
//                 icon: Icon(Icons.shopping_cart),
//                 onPressed: () {
//                   navigateTo(context, CartScreen());
//                 },
//               ),
//             ],
//           ),
//           body: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image(
//                 image: AssetImage('assets/images/aboutus.png'),
//                 height: 200,
//                 width: 100,
//               ),
//               Padding(
//                 padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
//                 child: Container(
//                   height: MediaQuery.of(context).size.height / 2,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(5),
//                     color: Colors.white,
//                   ),
//                   child: SingleChildScrollView(
//                     physics: BouncingScrollPhysics(),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم لأنها تعطي توزيعاَ طبيعياَ -إلى حد ما- للأحرف عوضاً عن استخدام "هنا يوجد محتوى نصي، هنا يوجد محتوى نصي" فتجعلها تبدو (أي الأحرف) وكأنها نص مقروء. العديد من برامح النشر المكتبي وبرامح تحرير صفحات الويب تستخدم لوريم إيبسوم بشكل إفتراضي كنموذج عن النص، وإذا قمت بإدخال "lorem ipsum" في أي محرك بحث ستظهر العديد من المواقع الحديثة العهد في نتائج البحث. على مدى السنين ظهرت نسخ جديدة ومختلفة من نص لوريم إيبسوم، أحياناً عن طريق الصدفة، وأحياناً عن عمد كإدخال بعض العبارات الفكاهية إليها.',
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: Colors.blue,
//                             fontFamily: 'Shamel',
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Spacer(),
//               Padding(
//                 padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
//                 child: Container(
//                   height: 60,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(5),
//                     color: Colors.white,
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         'V 3.0.1.2',
//                         style: TextStyle(
//                             fontSize: 16,
//                             fontFamily: 'Shamel',
//                             color: Colors.blue),
//                       ),
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ));
//   }
// }
