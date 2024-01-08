import 'package:flutter/material.dart';
import 'package:schemeapp/screens/user/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController pincontroller = TextEditingController();
  final TextEditingController addrescontroller = TextEditingController();
  DateTime selectedDate = DateTime.now();
  bool visibility = false;
  bool confirmPasswordvisibilit = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://images.unsplash.com/photo-1699976103128-ae05b6257fab?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzM3x8fGVufDB8fHx8fA%3D%3D"),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(40.0),
              child: Column(children: [
                Icon(
                  Icons.person,
                  size: 48.0,
                  color: Colors.black,
                ),
                Text(
                  'Welcome to registration',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  hintText: 'Enter your username',
                  prefixIcon: Icon(Icons.person),
                  suffixIcon: Icon(Icons.check_circle),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: EdgeInsets.all(12.0),
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: passwordController,
                obscureText: !visibility,
                decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'enter your password',
                    prefixIcon: Icon(Icons.password),
                    suffixIcon: IconButton(
                        icon: Icon(
                          visibility ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            visibility = !visibility;
                          });
                        }),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    contentPadding: EdgeInsets.all(12.0)),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: confirmPasswordController,
                obscureText: !confirmPasswordvisibilit,
                decoration: InputDecoration(
                    labelText: 'confirm password',
                    helperText: 'reenter password',
                    prefixIcon: Icon(Icons.password),
                    suffixIcon: IconButton(
                      icon: Icon(confirmPasswordvisibilit
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          confirmPasswordvisibilit = !confirmPasswordvisibilit;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    filled: true,
                    fillColor: Colors.grey[200],
                    contentPadding: EdgeInsets.all(12.0)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: emailcontroller,
                decoration: InputDecoration(
                  labelText: 'email',
                  hintText: 'Enter your email',
                  prefixIcon: Icon(Icons.person),
                  suffixIcon: Icon(Icons.check_circle),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: EdgeInsets.all(12.0),
                ),
                validator:  (value) {
    if (value == null || !value.endsWith("@gmail.com")) {
      return 'Please enter a valid email address ending with "@gmail.com"';
    }
    return null;
  },
              ),
            ),
            
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: addrescontroller,
                decoration: InputDecoration(
                  labelText: 'Address',
                  hintText: 'Enter your Adress',
                  prefixIcon: Icon(Icons.person),
                  suffixIcon: Icon(Icons.check_circle),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: EdgeInsets.all(12.0),
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: pincontroller,
                decoration: InputDecoration(
                  labelText: 'pincode',
                  hintText: 'Enter your pincode',
                  prefixIcon: Icon(Icons.person),
                  suffixIcon: Icon(Icons.check_circle),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: EdgeInsets.all(12.0),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                storeDataAndNavigate();
              },
              child: Text('Signup'),
            ),
          ],
        ),
      ),
    ));
  }

  void storeDataAndNavigate() async {
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();
    String Email = emailcontroller.text.trim();
    String Pincode = pincontroller.text.trim();
    String Adress = addrescontroller.text.trim();

    if (password == confirmPassword) {
      SharedPreferences preferences = await SharedPreferences.getInstance();

      preferences.setString('username', username);
      preferences.setString('password', password);
      preferences.setString('email', Email);
      preferences.setString('pincode', Pincode);
      preferences.setString('Addres', Adress);

      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } else {
      showErrorDialog('Password dont match');
    }
  }

  void showErrorDialog(String errorMessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('error'),
            content: Text(errorMessage),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('ok'))
            ],
          );
        });
  }
}
