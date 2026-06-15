import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sp/login.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void logout() async {

    SharedPreferences prefs =
        await SharedPreferences.getInstance();

    await prefs.setBool("login", false);

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => Login(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.amber,
      ),

      body: Center(
        child: ElevatedButton(

          onPressed: logout,

          child: Text("Logout"),
        ),
      ),
    );
  }
}