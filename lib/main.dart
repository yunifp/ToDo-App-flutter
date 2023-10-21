import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:wacana/screen/home.dart';
import 'package:wacana/screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent)
    );
    return MaterialApp(
      title: 'Wacana',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home:  const Splash(),
    );
  }
}

