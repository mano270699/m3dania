// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';

// class TextScreen extends StatelessWidget {
//   var nameUser;
//   var phoneUser;
//   TextScreen(String name, String phone) {
//     this.nameUser = name;
//     this.phoneUser = phone;
//   }
//   String email = FirebaseAuth.instance.currentUser.email;
//   String name = FirebaseAuth.instance.currentUser.displayName;
//   String phone = FirebaseAuth.instance.currentUser.phoneNumber;
//   String photo = FirebaseAuth.instance.currentUser.photoURL;
//   String token = FirebaseAuth.instance.currentUser.uid;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('test'),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             CircleAvatar(
//               child: Image(
//                 image: NetworkImage(
//                   photo,
//                 ),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Text('name: $name'),
//             Text('email: $email'),
//             Text('phone: $phone'),
//           ],
//         ),
//       ),
//     );
//   }
// }
