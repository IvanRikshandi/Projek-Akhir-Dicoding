import 'dart:async';
import 'package:aplikasi_pa1_dicoding/dashboard.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        return const Dashboard();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
              Color(0xff0C0C0C),
              Color.fromRGBO(8, 14, 41, 1),
            ])),
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/svgs/splash.png',
                      ),
                    ],
                  ),
                ),
                const Positioned(
                  bottom: 0,
                  child: Text(
                    'By Ivan Rikshandi',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
