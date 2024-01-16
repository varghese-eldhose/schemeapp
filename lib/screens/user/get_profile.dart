// Add the following class at the end of your existing code

import 'package:flutter/material.dart';
import 'package:schemeapp/screens/user/edit_profile.dart';
import 'package:schemeapp/screens/user/profiledisplay.dart';

class ProfileDisplay extends StatelessWidget {
  final ProfileController _profileController = ProfileController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Display'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('User: ${_profileController.userController.text}'),
            Text('Address: ${_profileController.addressController.text}'),
            Text('State: ${_profileController.stateController.text}'),
            Text('Pincode: ${_profileController.pincodeController.text}'),
            Text('Profession: ${_profileController.professionController.text}'),
            Text('Card: ${_profileController.cardController.text}'),
            Text('Qualification: ${_profileController.qualController.text}'),
            Text('Disability: ${_profileController.disableController.text}'),
            Text('Aadhar Number: ${_profileController.aadharController.text}'),
            Text('Contact: ${_profileController.contactController.text}'),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Profile(),
  ));
}
