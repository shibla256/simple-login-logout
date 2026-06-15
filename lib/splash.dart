import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sp/home.dart';
import 'package:sp/login.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState() {
    super.initState();
    go();
  }

  void go() async {
    await Future.delayed(Duration(seconds: 4));
    SharedPreferences pref = await SharedPreferences.getInstance();

    bool? isLogin = pref.getBool("login");

    if (!mounted) return;

    if (isLogin == true) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => Home()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) =>Login()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 167, 173, 176),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.place, size: 70,),
          SizedBox(height: 30,),
          Text("place",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)
          
          
          
          
          ],
        ),
      ),
    );
  }
}
