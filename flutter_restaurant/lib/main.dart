import 'package:flutter/material.dart';
import 'package:flutter_restaurant/screens/home.dart';
import 'package:flutter_restaurant/screens/login.dart';
import 'package:flutter_restaurant/screens/menuitem.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant Waiter Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/menu': (context) => MenuScreen(),
      },
    );
  }
}

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Restaurant Menu',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MenuScreen(),
//     );
//   }
// }
