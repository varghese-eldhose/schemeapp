// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Notifi(),
//     );
//   }
// }

// class Notifi extends StatefulWidget {
//   @override
//   _NotifiState createState() => _NotifiState();
// }

// class _NotifiState extends State<Notifi> {
//   final String apiUrl = 'http://10.0.2.2:8000/Scheme/notification/';

//   Future<List<dynamic>> fetchData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     var accessToken = prefs.getString('accessToken') ?? "";

//     final response = await http.get(
//       Uri.parse(apiUrl),
//       headers: {'Authorization': 'Bearer $accessToken'},
//     );

//     if (response.statusCode == 200) {
//       return json.decode(response.body);
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Notification'),
//       ),
//       body: FutureBuilder(
//         future: fetchData(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else {
//             // Display your data here
//             List<dynamic> data = snapshot.data as List<dynamic>;

//             return ListView.builder(
//               itemCount: data.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(data[index]['title']),
//                   subtitle: Text(data[index]['body']),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
