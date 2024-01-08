import 'package:flutter/material.dart';
import 'package:schemeapp/screens/user/loginpage.dart';
import 'package:schemeapp/screens/user/my_profile.dart';
import 'package:schemeapp/views/newScheme.dart';
import 'package:schemeapp/views/scheme.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                 "https://qph.cf2.quoracdn.net/main-qimg-89dc4d0e21c42c7f0778582ee45c7440-pjlq",
                  ),
              fit: BoxFit.fill)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView(
              children: [
                Card(
                  elevation: 5,
                  margin: EdgeInsets.all(9),
                  child: ListTile(
                    leading: Icon(Icons.star),
                    title: Text('My Profile',
                        style: TextStyle(
                          fontSize: 20,
                        )),
                   trailing: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MyProfile()));
                      },
                      child: Icon(Icons.arrow_forward_ios_outlined),
                    ),
                    contentPadding: EdgeInsets.only(top: 16.0, left: 10),
                  ),
                ),
                Card(
                  elevation: 5,
                  margin: EdgeInsets.all(9),
                  child: ListTile(
                    leading: Icon(Icons.star),
                    title: Text('Scheme', style: TextStyle(fontSize: 20)),
                    trailing:  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => newScheme()));
                      },
                      child: Icon(Icons.arrow_forward_ios_outlined),
                    ),
                    
                    contentPadding: EdgeInsets.only(top: 16.0, left: 10),
                  ),
                ),
                Card(
                  elevation: 5,
                  margin: EdgeInsets.all(9),
                  child: ListTile(
                    leading: Icon(Icons.star),
                    title: Text('My Scheme', style: TextStyle(fontSize: 20)),
                    trailing: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SchemePage()));
                      },
                      child: Icon(Icons.arrow_forward_ios_outlined),
                    ),
                    contentPadding: EdgeInsets.only(top: 16.0, left: 10),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Text("logout"))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
