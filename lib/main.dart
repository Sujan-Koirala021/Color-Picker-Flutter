import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../pages/home_page.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      //  Disable landscape device orientation
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color.fromRGBO(38, 38, 38, 0.4),
      ),
      home : const HomePage(),
    );
  }
}