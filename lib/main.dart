import 'package:beats_app/src/pages/home_page.dart';
import 'package:beats_app/src/providers/productos_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductosProvider())
      ],
      child: MaterialApp(
        title: 'Beats App',
        initialRoute: 'home',
        debugShowCheckedModeBanner: false,
        routes: {'home': (BuildContext context) => HomePage()},
      ),
    );
  }
}
