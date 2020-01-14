import 'package:beats_app/src/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beats App',
      initialRoute: 'home',
      debugShowCheckedModeBanner: false,
      routes: {
        'home': (BuildContext context)=>HomePage()
      },
    );
  }
}
