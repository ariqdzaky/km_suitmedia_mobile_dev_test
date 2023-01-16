import 'package:flutter/material.dart';
import 'package:km_mobile_dev_test/pages/first_page.dart';
import 'package:km_mobile_dev_test/pages/second_page.dart';
import 'package:km_mobile_dev_test/pages/third_page.dart';

//import page

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static MaterialColor themeColor = const MaterialColor(
    0xFF2B637B,
    <int, Color>{
      50: Color(0xFF2B637B),
      100: Color(0xFF2B637B),
      200: Color(0xFF2B637B),
      300: Color(0xFF2B637B),
      400: Color(0xFF2B637B),
      500: Color(0xFF2B637B),
      600: Color(0xFF2B637B),
      700: Color(0xFF2B637B),
      800: Color(0xFF2B637B),
      900: Color(0xFF2B637B),
    },
  );
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Developer Test',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: themeColor,
      ),
      home: const LoginPage(),
    );
  }
}
