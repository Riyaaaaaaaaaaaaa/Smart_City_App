import 'package:flutter/material.dart';

import 'profile.dart';
import 'screen1.dart';
import 'screen2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart City',
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/" : (context) => const MyHomePage(),
        "/second" : (context) => Screen2(),
        "/profile" : (context) => Profile(),
      },
    );
  }
}

