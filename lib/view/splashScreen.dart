import 'package:flutter/material.dart';
import 'package:mytask/view/home/homePage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homePage(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(child: Icon(Icons.safety_check,size: 50,)),
    );
  }
  Future<void> homePage(context)async{
await Future.delayed(Duration(seconds: 3));
Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
  }
}

