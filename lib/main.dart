import 'package:flutter/material.dart';

import 'package:crypto_flutter/my_home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.pink,
        textTheme: TextTheme(
          headline: TextStyle(
            color: Colors.purple[600],
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
          body1: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.pink[600],
          ),
          body2: TextStyle(fontSize: 20, color: Colors.black),
          subtitle: TextStyle(fontSize: 14, color: Colors.black87),
        ),
      ),
      darkTheme: ThemeData(
        accentColor: Colors.pink,
        brightness: Brightness.dark,
        textTheme: TextTheme(
          headline: TextStyle(
            color: Colors.purpleAccent,
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
          body1: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.pinkAccent,
          ),
          body2: TextStyle(fontSize: 20, color: Colors.white),
          subtitle: TextStyle(fontSize: 14, color: Colors.white70),
        ),
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
