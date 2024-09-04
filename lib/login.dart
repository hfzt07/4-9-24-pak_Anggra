import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/dashboard.dart';
import 'dart:convert';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<bool> _login() async {
    String username = _usernameController.text;
    String password = _passwordController.text;

    final response = await http.get(
        Uri.parse('https://praktikum-cpanel-unbin.com/api_praktikum_sipa/'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      for (var person in data) {
        if (person['username'] == username && person['password'] == password) {
          return true; // Login berhasil
        }
      }
      return false; // Login gagal
    } else {
      throw Exception('Gagal mengambil data pengguna');
    }
  }

  void _handleLogin() async {
    bool success = await _login();
    if (success) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardPage()),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Login Gagal'),
            content: Text('Username atau kata sandi salah.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
              keyboardType: TextInputType.text,
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Kata Sandi'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _handleLogin,
              child: Text('Masuk'),
            ),
          ],
        ),
      ),
    );
  }
}
