import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_firebase/UI/LogInScreen.dart';

class SplashServices{

  void isLogIn(BuildContext context){
    Timer(Duration(seconds: 3),()=>Navigator.push(context, MaterialPageRoute(builder: (context) =>LogInScreen())));
    }
  }
