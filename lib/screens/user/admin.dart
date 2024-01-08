import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MaterialApp(home: Admin()));
}

class Admin extends StatefulWidget {
  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  TextEditingController linkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: linkController,
              decoration: InputDecoration(labelText: 'Enter Link'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String uploadedLink = linkController.text;
               _launchURL(uploadedLink);
              },
              child: Text('Upload Link'),
            ),
          ],
        ),
      ),
    );
  }

  _launchURL(String link) async {
    if (await canLaunch(link)) {
      await launch(link);
    } else {
      throw 'Could not launch $link';
    }
  }
}
