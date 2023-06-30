import 'package:flutter/material.dart';
import 'core/colors/colors.dart';
import 'presentation/screens/home screen/home_screen.dart';

void main() {
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employee Management System',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kBGcolor,
        primarySwatch: Colors.blueGrey,
      ),
      home:  HomeScreen(),
    );
  }
}