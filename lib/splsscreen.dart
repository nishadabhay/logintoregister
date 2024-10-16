import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lession1/home.dart';
import 'package:lession1/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class splsscreen extends StatefulWidget {
  const splsscreen({super.key});
  static const KEY_LOGIN = "login";

  @override
  State<splsscreen> createState() => splsscreenState();
}

class splsscreenState extends State<splsscreen> {
  @override
  void initState() {
    super.initState();
   whereTogo();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        child: Center(child: Icon(Icons.account_circle,color: Colors.white,size: 100,)),
      ),
    );
  }

  void whereTogo()async {

    var prefs =await SharedPreferences.getInstance();

      var isLogedIn = prefs.getBool(splsscreen.KEY_LOGIN);

    Timer(Duration(seconds: 2),(){
      if(isLogedIn != null){
        if(isLogedIn){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> myHomepage()));

        }else{
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Mylogin()));
        }

      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Mylogin()));
      }

    },);
  }
}
