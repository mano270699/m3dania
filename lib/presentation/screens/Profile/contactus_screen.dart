// import 'dart:async';

// import 'package:emaie/shared/components/components.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_icons/flutter_icons.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:geolocator/geolocator.dart';

// import 'package:geocoder/geocoder.dart';

// import 'package:flutter/material.dart';

// class ContactScreen extends StatelessWidget {
//   //const ContactScreen({Key key}) : super(key: key);
//   var textTitleMessageController = TextEditingController();
//   void launchUrl(String url) async {
//     if (await canLaunch(url)) {
//       launch(url);
//     } else {
//       throw "Could not launch $url";
//     }
//   }

//   static double latitude = 30.3578093;
//   static double longitude = 31.0488629;
//   Completer<GoogleMapController> _controller = Completer();
//   static final CameraPosition _kLake =
//       CameraPosition(target: LatLng(latitude, longitude), zoom: 11);
//   // final Set<Marker> _markers = {};

//   static const LatLng _center = const LatLng(30.3578093, 31.0488629);
//   final Set<Marker> _markers = {};
//   LatLng _lastMapPosition = _center;
//   MapType _currentMapType = MapType.normal;
//   double myLocatiolat;
//   double myLocatiolong;
//   static final CameraPosition _position1 = CameraPosition(
//     bearing: 192.833,
//     target: LatLng(20.09208841067151, 55.63329836418767),
//     tilt: 59.440,
//     zoom: 11.0,
//   );
//   _onMapCreated(GoogleMapController controller) {
//     _controller.complete(controller);
//   }

//   _onCameraMove(CameraPosition position) {
//     _lastMapPosition = position.target;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Directionality(
//         textDirection: TextDirection.rtl,
//         child: Scaffold(
//           backgroundColor: HexColor('#F5F8F9'),
//           appBar: AppBar(
//             title: Text(
//               'تواصل معنا',
//               style: TextStyle(
//                 fontFamily: 'Shamel',
//               ),
//             ),
//             centerTitle: true,
//           ),
//           body: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: Colors.white,
//             ),
//             child: SingleChildScrollView(
//               physics: BouncingScrollPhysics(),
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: 5,
//                   ),
//                   Container(
//                     width: double.infinity,
//                     child: Row(
//                       children: [
//                         Container(
//                           width: 250,
//                           padding: const EdgeInsetsDirectional.only(
//                             start: 10,
//                           ),
//                           child: Text(
//                             'العنوان : شارع الملك عبد الله الثاني - مجمع البركة',
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             style: TextStyle(
//                               fontSize: 12,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.blue,
//                               fontFamily: 'Shamel',
//                             ),
//                           ),
//                         ),
//                         Spacer(),
//                         Padding(
//                           padding: const EdgeInsetsDirectional.only(end: 10),
//                           child: Text(
//                             'الطابق الثاني- 5',
//                             style: TextStyle(
//                               color: Colors.blue,
//                               fontSize: 12,
//                               fontWeight: FontWeight.bold,
//                               fontFamily: 'Shamel',
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Container(
//                       height: 250,
//                       child: GoogleMap(
//                         onMapCreated: _onMapCreated,
//                         initialCameraPosition: CameraPosition(
//                           target: _center,
//                           zoom: 11.0,
//                         ),
//                         mapType: _currentMapType,
//                         markers: _markers,
//                         onCameraMove: _onCameraMove,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   Padding(
//                     padding:
//                         const EdgeInsets.only(left: 10, right: 10, bottom: 10),
//                     child: Container(
//                       height: 50,
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: HexColor('#49C089'),
//                       ),
//                       clipBehavior: Clip.antiAliasWithSaveLayer,
//                       child: MaterialButton(
//                         height: 50,
//                         onPressed: () {
//                           // for dial phone number
//                           launchUrl("tel:+99364921507");
//                         },
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Center(
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text(
//                                     '0266556',
//                                     style: TextStyle(
//                                         color: Colors.white,
//                                         fontWeight: FontWeight.bold,
//                                         fontFamily: 'Shamel'),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Spacer(),
//                             Icon(
//                               Icons.phone,
//                               color: Colors.white,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding:
//                         const EdgeInsets.only(left: 10, right: 10, bottom: 10),
//                     child: Container(
//                       height: 50,
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: HexColor('#5685E2'),
//                       ),
//                       clipBehavior: Clip.antiAliasWithSaveLayer,
//                       child: MaterialButton(
//                         height: 50,
//                         onPressed: () {
//                           //for launching url
//                           launchUrl("https://www.facebook.com/");
//                         },
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               'تواصل معنا عبر فيسبوك',
//                               style: TextStyle(
//                                   color: Colors.white, fontFamily: 'Shamel'),
//                             ),
//                             Spacer(),
//                             Icon(
//                               FontAwesome.facebook,
//                               color: Colors.white,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding:
//                         const EdgeInsets.only(left: 10, right: 10, bottom: 10),
//                     child: Container(
//                       height: 50,
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: HexColor('#DA489B'),
//                       ),
//                       clipBehavior: Clip.antiAliasWithSaveLayer,
//                       child: MaterialButton(
//                         height: 50,
//                         onPressed: () {
//                           launchUrl('https://www.instagram.com/');
//                         },
//                         child: Row(
//                           children: [
//                             Center(
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Center(
//                                     child: Text(
//                                       'تواصل معنا عبر انستقرام',
//                                       style: TextStyle(
//                                           color: Colors.white,
//                                           fontFamily: 'Shamel'),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Spacer(),
//                             Icon(
//                               FontAwesome.instagram,
//                               color: Colors.white,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding:
//                         const EdgeInsets.only(right: 10, left: 10, bottom: 5),
//                     child: defaultFormText(
//                         controller: textTitleMessageController,
//                         type: TextInputType.text,
//                         hint: 'موضوع الرسالة',
//                         prefixIcon: Icons.message),
//                   ),
//                   Padding(
//                     padding:
//                         const EdgeInsets.only(right: 10, left: 10, bottom: 5),
//                     child: TextFormField(
//                         maxLines: 3,
//                         decoration: InputDecoration(
//                           hintText: 'أكتب الرسالة ...',
//                           contentPadding: new EdgeInsets.symmetric(
//                               vertical: 10.0, horizontal: 10.0),
//                           fillColor: Colors.white,
//                           hintStyle: TextStyle(fontFamily: 'Shamel'),
//                           filled: true,
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(0),
//                           ),
//                         )),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(
//                       top: 12,
//                     ),
//                     child: defaultButton(
//                         text: ' إرسال', function: () {}, height: 40),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ));
//   }
// }
