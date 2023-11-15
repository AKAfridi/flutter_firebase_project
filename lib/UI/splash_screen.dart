import 'package:flutter/material.dart';
import 'package:flutter_firebase/FireBaseServicess/SplashServices.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices =SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashServices.isLogIn(context);
      }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'FireBase Flutter',
          style: TextStyle(
              color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }
}
