import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather_app/screens/home_screen.dart';
import 'package:weather_app/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  @override
  void initState() {
    _timer = Timer(Duration(seconds: 3), (){
      if(mounted){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>HomeScreen()));
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: Column(
            children: [
              Center(
                child: Text(
                  "Discover The \n Weather In Your City",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                    color: Theme.of(context).colorScheme.secondary,
                    height: 1.2,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
              SizedBox(height: 100),
              Icon(Icons.cloud,size: 350,color: Theme.of(context).colorScheme.secondary,),
              SizedBox(height: 100),
              Center(
                child: Text(
                  "Get to know your weather maps and\nradar recipitations forecast",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
      
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )
                  ),
                  onPressed: (){
                    _timer.cancel();
                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>HomeScreen()));
                  }, 
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 18),
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Theme.of(context).colorScheme.secondary,
                    ),
                  ))
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}