import 'package:flutter/material.dart';
import 'package:lession1/loginpage.dart';
import 'package:lession1/splsscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class myHomepage extends StatefulWidget {
  const myHomepage({super.key});

  @override
  State<myHomepage> createState() => _myHomepageState();
}

class _myHomepageState extends State<myHomepage> {
  String? user_email;
  var emailvalue = "No value saved";
  @override
  void initState() {
    super.initState();
    getValue();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: Center(
          child: Text(
            "HomePage",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w700, color: Colors.cyan),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(decoration: BoxDecoration(color: Colors.amber),child: Text("Drawer Header"),),
            ListTile(title: Text("Profile",),onTap: (){
              // Then close the drawer
              Navigator.pop(context);
            },),
            ListTile(title: Text("Setting"),onTap: (){
              // Then close the drawer
              Navigator.pop(context);
            },),
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Text(emailvalue,style: TextStyle(fontSize: 20,color: Colors.black),),
            SizedBox(height: 30,),

            ElevatedButton(onPressed: ()async{

              var prefs =await SharedPreferences.getInstance();
               prefs.remove(splsscreen.KEY_LOGIN);
               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Mylogin()));

            }, child: Text("Logout"))
          ],
        ),
      ),
    );
  }

  void getValue()async {
     var prefs =await SharedPreferences.getInstance();
     var getname = prefs.getString(splsscreen.KEY_LOGIN);
     emailvalue = getname ?? "No value saved";

      setState(() {

      });

  }
  
}
