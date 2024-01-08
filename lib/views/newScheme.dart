import 'package:flutter/material.dart';
import 'package:schemeapp/views/farmer.dart';
import 'package:schemeapp/views/student.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: newScheme(),
    );
  }
}

class newScheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schemes'),
      ),
      body: Center(
        child: Container(
          width: 800,
          height: 800,
          padding: EdgeInsets.all(50.0),
          child: GridView.count(
            crossAxisCount: 2,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Farmer()),
                  );
                },
                child: Container(
                  height: 150,
                  color: Colors.blue,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Farmer',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 8),
                      Image.network(
                        'https://example.com/farmer_image.jpg',
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Farmer()),
                  );
                },
                child: Container(
                  height: 150,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Farmer',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 8),
                      Image.network(
                        'https://tse4.mm.bing.net/th?id=OIP.O56fCHA80E6okhdKlVMz2wHaHV&pid=Api&P=0&h=180',
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Student()),
                  );
                },
                child: Container(
                  height: 150,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Student',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 8),
                      Image.network(
                        'https://tse4.mm.bing.net/th?id=OIP.2eLI6mmHWk1N9TJfgeq7BAHaFe&pid=Api&P=0&h=180',
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Student()),
                  );
                },
                child: Container(
                  height: 150,
                  color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Container 3',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 8),
                      Image.network(
                        'https://example.com/container4_image.jpg',
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
