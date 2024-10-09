import 'package:flutter/material.dart';
  import 'package:sanoko_shop2/screens/frist_screen.dart';
import 'package:sanoko_shop2/screens/home_screen.dart';
import 'package:sanoko_shop2/var.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CircleAnimationScreen(),
    );
  }
}




