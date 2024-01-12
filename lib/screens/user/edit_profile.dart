// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class EditProfile extends StatefulWidget {
//   @override
//   State<EditProfile> createState() => _EditProfileState();
// }

// class _EditProfileState extends State<EditProfile> {
//   TextEditingController usernameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController statecontroller = TextEditingController();
//   TextEditingController pincotroller = TextEditingController();
//   TextEditingController addressController = TextEditingController();
//   TextEditingController contactController = TextEditingController();
//   TextEditingController aadharController = TextEditingController();

// String profesion = 'Farmer';
// String card = 'APL';
// String qualification = 'SSLC';
// String disable = "None";
//   @override

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit Profile'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               // username
//               TextFormField(
//                 controller: usernameController,
//                 decoration: InputDecoration(labelText: 'Username'),
//               ),

//               // Address
//               TextFormField(
//                 controller: addressController,
//                 decoration: InputDecoration(labelText: 'Address'),
//               ),

//               // state
//               TextFormField(
//                 controller: statecontroller,
//                 decoration: InputDecoration(labelText: 'stste'),
//               ),

//               // Pincod
//               TextFormField(
//                 controller: pincotroller,
//                 decoration: InputDecoration(labelText: 'Pincode'),
//               ),

//               // Adhar number
//               TextFormField(
//                 controller: aadharController,
//                 decoration: InputDecoration(labelText: 'Adhar number'),
//               ),

//               // Contact
//               TextFormField(
//                 controller: contactController,
//                 decoration: InputDecoration(labelText: 'Contact'),
//               ),

//               SizedBox(height: 20.0),

//               // proffesion
//               DropdownButtonFormField<String>(
//                 value: profesion,
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     profesion = newValue!;
//                   });
//                 },
//                 items: <String>[
//                   'Farmer',
//                   'Student',
//                   'Disability',
//                   'Government Employ'
//                 ].map<DropdownMenuItem<String>>((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//                 decoration: InputDecoration(labelText: 'Profession'),
//               ),
//               SizedBox(height: 20.0),

//               // card
//               DropdownButtonFormField<String>(
//                 value: card,
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     card = newValue!;
//                   });
//                 },
//                 items: <String>[
//                   'APL',
//                   'BPL',
//                   'AAY',
//                 ].map<DropdownMenuItem<String>>((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//                 decoration: InputDecoration(labelText: 'Card'),
//               ),
//               SizedBox(height: 20.0),

//               // Qualifivcation
//               DropdownButtonFormField<String>(
//                 value: qualification,
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     qualification = newValue!;
//                   });
//                 },
//                 items: <String>['SSLC', 'PLUS TWO', 'UG', 'PG']
//                     .map<DropdownMenuItem<String>>((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//                 decoration: InputDecoration(labelText: 'Qualification'),
//               ),
//               SizedBox(height: 20.0),

//               // Disable
//               DropdownButtonFormField<String>(
//                 value: disable,
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     disable = newValue!;
//                   });
//                 },
//                 items: <String>[
//                   "Mobility Impairment",
//                   "Visual Impairment",
//                   "Hearing Impairment",
//                   "Learning Disability",
//                   "Autism Spectrum Disorder",
//                   "Speech Impairment",
//                   "Intellectual Disability",
//                   "None",
//                 ].map<DropdownMenuItem<String>>((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//                 decoration: InputDecoration(labelText: 'Disable'),
//               ),
//               SizedBox(height: 20.0),

//               ElevatedButton(
//                 onPressed: () {
//                   //
//                 },
//                 child: Text('Save'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyHomePage());
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController usernameController = TextEditingController();
  // TextEditingController emailController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController pinController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController aadharController = TextEditingController();

  Future<void> postData() async {
    final url = 'http://10.0.2.2:8000/AdminUI/profile/';

    final response = await http.post(
      Uri.parse(url),
      body: {
        'user': usernameController.text,
        'Address': addressController.text,
        'State': stateController.text,
        'Pincode': pinController.text,
        'Aadhar_Number': addressController.text,
        'Contact': contactController.text,
        'profession': aadharController.text,
        'card': aadharController.text,
        'qual': aadharController.text,
        'disable': aadharController.text,
      },
    );

    if (response.statusCode == 201) {
      print('Data posted successfully');
    } else {
      print('Failed to post data. Status code: ${response.statusCode}');
    }
  }

  String profesion = 'Farmer';
  String card = 'APL';
  String qualification = 'SSLC';
  String disable = "None";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HTTP Post Example'),
      ),
      body:
          // Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       TextField(
          //         controller: usernameController,
          //         decoration: InputDecoration(labelText: 'Username'),
          //       ),
          //       TextField(
          //         controller: emailController,
          //         decoration: InputDecoration(labelText: 'Email'),
          //       ),
          //       TextField(
          //         controller: stateController,
          //         decoration: InputDecoration(labelText: 'State'),
          //       ),
          //       TextField(
          //         controller: pinController,
          //         decoration: InputDecoration(labelText: 'Pin'),
          //       ),
          //       TextField(
          //         controller: addressController,
          //         decoration: InputDecoration(labelText: 'Address'),
          //       ),
          //       TextField(
          //         controller: contactController,
          //         decoration: InputDecoration(labelText: 'Contact'),
          //       ),
          //       TextField(
          //         controller: aadharController,
          //         decoration: InputDecoration(labelText: 'Aadhar'),
          //       ),
          //       SizedBox(height: 20),
          //       ElevatedButton(
          //         onPressed: postData,
          //         child: Text('Post Data'),
          //       ),
          //     ],
          //   ),
          // ),

          SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // username
              TextFormField(
                controller: usernameController,
                decoration: InputDecoration(labelText: 'Username'),
              ),

              // Address
              TextFormField(
                controller: addressController,
                decoration: InputDecoration(labelText: 'Address'),
              ),

              // state
              TextFormField(
                controller: stateController,
                decoration: InputDecoration(labelText: 'stste'),
              ),

              // Pincod
              TextFormField(
                controller: pinController,
                decoration: InputDecoration(labelText: 'Pincode'),
              ),

              // Adhar number
              TextFormField(
                controller: aadharController,
                decoration: InputDecoration(labelText: 'Adhar number'),
              ),

              // Contact
              TextFormField(
                controller: contactController,
                decoration: InputDecoration(labelText: 'Contact'),
              ),

              SizedBox(height: 20.0),

              // proffesion
              DropdownButtonFormField<String>(
                value: profesion,
                onChanged: (String? newValue) {
                  setState(() {
                    profesion = newValue!;
                  });
                },
                items: <String>[
                  'Farmer',
                  'Student',
                  'Disability',
                  'Government Employ'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Profession'),
              ),
              SizedBox(height: 20.0),

              // card
              DropdownButtonFormField<String>(
                value: card,
                onChanged: (String? newValue) {
                  setState(() {
                    card = newValue!;
                  });
                },
                items: <String>[
                  'APL',
                  'BPL',
                  'AAY',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Card'),
              ),
              SizedBox(height: 20.0),

              // Qualifivcation
              DropdownButtonFormField<String>(
                value: qualification,
                onChanged: (String? newValue) {
                  setState(() {
                    qualification = newValue!;
                  });
                },
                items: <String>['SSLC', 'PLUS TWO', 'UG', 'PG']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Qualification'),
              ),
              SizedBox(height: 20.0),

              // Disable
              DropdownButtonFormField<String>(
                value: disable,
                onChanged: (String? newValue) {
                  setState(() {
                    disable = newValue!;
                  });
                },
                items: <String>[
                  "Mobility Impairment",
                  "Visual Impairment",
                  "Hearing Impairment",
                  "Learning Disability",
                  "Autism Spectrum Disorder",
                  "Speech Impairment",
                  "Intellectual Disability",
                  "None",
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Disable'),
              ),
              SizedBox(height: 20.0),

              ElevatedButton(
                onPressed: () {
                  //
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
