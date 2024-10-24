import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lession1/Custom%20files/roundedbtn.dart';
import 'package:lession1/drawerpages/profile.dart';
import 'package:lession1/drawerpages/setting.dart';
import 'package:lession1/loginpage.dart';
import 'package:lession1/splsscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class myHomepage extends StatefulWidget {
  const myHomepage({super.key});

  @override
  State<myHomepage> createState() => _myHomepageState();
}

class _myHomepageState extends State<myHomepage> {
  String? userEmail;
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
        centerTitle: true,
        backgroundColor: Colors.black38,
        title: Text(
          "HomePage",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w700, color: Colors.cyan),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.amber),
              child: Text(emailvalue),
            ),
            ListTile(
              title: Text(
                "Profile",
              ),
              leading: Icon(Icons.person),
              onTap: () {
                // Then close the drawer
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Myprofile()));
              },
            ),
            ListTile(
              title: Text("Setting"),
              leading: Icon(Icons.settings),
              onTap: () {
                // Then close the drawer
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => MySetting()));
              },
            ),
            ListTile(),
            ListTile(),
            ListTile(),
            ListTile(
              title: Text("LogOut"),
              onTap: () async {
                var prefs = await SharedPreferences.getInstance();
                prefs.remove(splsscreen.KEY_LOGIN);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Mylogin()));
              },
              leading: Icon(Icons.logout),
            ),
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Card(
              child: ListTile(
                title: Text("First item"),
                subtitle: Text("This is my first item"),
                onTap: () {
                  Get.defaultDialog(
                      title: 'Delete chat',
                      titlePadding: EdgeInsets.only(top: 20),
                      contentPadding: EdgeInsets.all(20),
                      middleText: 'Are you sure want to delete chat',
                      confirm: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Ok")),
                      cancel:
                          TextButton(onPressed: () {}, child: Text("Cancle")));
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Bottom sheet item"),
                subtitle: Text("This is my first item"),
                onTap: () {
                  Get.bottomSheet(Container(
                    decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        ListTile(
                          onTap: () {
                            Get.changeTheme(ThemeData.light());
                          },
                          leading: Icon(Icons.light_mode),
                          title: Text("LightMode"),
                        ),
                        ListTile(
                          onTap: () {
                            Get.changeTheme(ThemeData.dark());
                          },
                          leading: Icon(Icons.dark_mode),
                          title: Text("DarkMode"),
                        )
                      ],
                    ),
                  ));
                },
              ),
            ),
            ElevatedButton(
                onPressed: () {},
                child: Column(
                  children: [
                    Container(
                      child: RoundedButton(
                        btnName: "PLAY",
                        icon: Icon(Icons.doorbell),
                        callBack: () {
                          print("Abhay!!!!!!!!");
                        },
                        textStyle:
                            TextStyle(fontSize: 50, fontWeight: FontWeight.w700,color: Colors.lightGreen),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      child: RoundedButton(
                        btnName: "Subscribe",
                        callBack: () {
                          print("Abhay!!!!!!!!");
                        },
                        textStyle:
                            TextStyle(fontSize: 50, fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      child: RoundedButton(
                        btnName: "Login",
                        icon: Icon(Icons.doorbell),
                        callBack: () {
                          print("Abhay!!!!!!!!");
                        },
                        textStyle:
                            TextStyle(fontSize: 50, fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      child: RoundedButton(
                        btnName: "Logout",
                        callBack: () {
                          print("Abhay!!!!!!!!");
                        },
                        textStyle:
                            TextStyle(fontSize: 50, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Get.snackbar("Abhay Nishad", "Subscribe my channel",
            backgroundColor: Colors.lightGreen);
      }),
    );
  }

  void getValue() async {
    var prefs = await SharedPreferences.getInstance();
    var getemail = prefs.getString("user_email");
    emailvalue = getemail ?? "No value saved";

    setState(() {});
  }
}
