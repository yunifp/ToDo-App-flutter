import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wacana/constrants/color.dart';
import 'package:wacana/screen/home.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Warna.mainColor,
                  Warna.mainColor,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp)),
        child: Center(
          child: Stack(
            children: [
              Positioned(
                bottom: 30,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    if (Platform.isIOS)
                      const CupertinoActivityIndicator(
                        radius: 15,
                      )
                    else
                      const CircularProgressIndicator(
                        color: Colors.white,
                      ),
                      const SizedBox(height: 100),
                      const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'developed by ',
                          style: TextStyle(
                            fontSize: 17,
                            color: Warna.textDark1,
                          ),
                        ),
                        InkWell(
                          child: Text(
                            'yunifputra',
                            style:
                                TextStyle(fontSize: 15, color: Warna.textDark3),
                          ),
                        ),
                      ],
                    ),
                    
                  
                  ],
                ),
                
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
