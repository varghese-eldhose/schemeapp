// import 'package:flutter/material.dart';
// import 'package:schemeapp/screens/user/edit_profile.dart';
// import 'package:schemeapp/screens/user/loginpage.dart';
// import 'package:schemeapp/views/Mysche.dart';
// import 'package:schemeapp/views/scheme.dart';
// import 'package:schemeapp/views/uu.dart';

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Home"),
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: NetworkImage(
//                     "https://qph.cf2.quoracdn.net/main-qimg-89dc4d0e21c42c7f0778582ee45c7440-pjlq",
//                   ),
//                   fit: BoxFit.fill,
//                 ),
//               ),
//               child: Text(
//                 'User Name', // Replace with the actual user name
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 20,
//                 ),
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.star),
//               title: Text('My Profile', style: TextStyle(fontSize: 20)),
//               onTap: () {
//                 Navigator.of(context).push(
//                   // MaterialPageRoute(builder: (context) => EditProfile()),
//                   MaterialPageRoute(builder: (context) => Profile()),

//                 );
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.star),
//               title: Text('Scheme', style: TextStyle(fontSize: 20)),
//               onTap: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(builder: (context) => FilterSchemePage()),
//                 );
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.star),
//               title: Text('All Scheme', style: TextStyle(fontSize: 20)),
//               onTap: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(builder: (context) => SchemePage()),
//                 );
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.exit_to_app),
//               title: Text('Logout', style: TextStyle(fontSize: 20)),
//               onTap: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(builder: (context) => LoginPage()),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: NetworkImage(
//               "https://qph.cf2.quoracdn.net/main-qimg-89dc4d0e21c42c7f0778582ee45c7440-pjlq",
//             ),
//             fit: BoxFit.fill,
//           ),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Expanded(
//               child: ListView(
//                 children: [
//                   Card(
//                     elevation: 5,
//                     margin: EdgeInsets.all(9),
//                     child: ListTile(
//                       leading: Icon(Icons.star),
//                       title: Text('My Profile',
//                           style: TextStyle(
//                             fontSize: 20,
//                           )),
//                       trailing: ElevatedButton(
//                         onPressed: () {
//                           Navigator.of(context).push(MaterialPageRoute(
//                               // builder: (context) => EditProfile()));
//                                builder: (context) => Profile()));

//                         },
//                         child: Icon(Icons.arrow_forward_ios_outlined),
//                       ),
//                       contentPadding: EdgeInsets.only(top: 16.0, left: 10),
//                     ),
//                   ),
//                   Card(
//                     elevation: 5,
//                     margin: EdgeInsets.all(9),
//                     child: ListTile(
//                       leading: Icon(Icons.star),
//                       title: Text('Scheme', style: TextStyle(fontSize: 20)),
//                       trailing: ElevatedButton(
//                         onPressed: () {
//                           Navigator.of(context).push(MaterialPageRoute(
//                               builder: (context) => FilterSchemePage()));
//                         },
//                         child: Icon(Icons.arrow_forward_ios_outlined),
//                       ),
//                       contentPadding: EdgeInsets.only(top: 16.0, left: 10),
//                     ),
//                   ),
//                   Card(
//                     elevation: 5,
//                     margin: EdgeInsets.all(9),
//                     child: ListTile(
//                       leading: Icon(Icons.star),
//                       title: Text('All Scheme', style: TextStyle(fontSize: 20)),
//                       trailing: ElevatedButton(
//                         onPressed: () {
//                           Navigator.of(context).push(MaterialPageRoute(
//                               builder: (context) => SchemePage()));
//                         },
//                         child: Icon(Icons.arrow_forward_ios_outlined),
//                       ),
//                       contentPadding: EdgeInsets.only(top: 16.0, left: 10),
//                     ),
//                   ),
//                   ElevatedButton(
//                       onPressed: () {
//                         Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => LoginPage()));
//                       },
//                       child: Text("Logout"))
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


