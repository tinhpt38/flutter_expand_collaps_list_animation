import 'package:animated_expaned_project/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Demo này thuộc quyền sở hữu của Mạc Mi");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expand Collaps List Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}