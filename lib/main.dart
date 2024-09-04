import 'package:flutter/material.dart';
import 'login.dart'; // Mengimpor LoginPage

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(), // Menetapkan LoginPage sebagai halaman utama
    );
  }
}
