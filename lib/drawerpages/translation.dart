import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';

class MyTranslation extends StatefulWidget {
  const MyTranslation({super.key});

  @override
  State<MyTranslation> createState() => _MyTranslationState();
}

class _MyTranslationState extends State<MyTranslation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Translation"),backgroundColor: Colors.blueAccent,),
      body: Column(
        children: [
          
          ListTile(
            title: Text('message'.tr),
            subtitle: Text('name'.tr),
          ),
          SizedBox(height: 50,),
          Row(
            children: [
              OutlinedButton(onPressed: (){

                Get.updateLocale(Locale('en' , 'US'));
              }, child: Text("English")),
              SizedBox(width: 20,),
              OutlinedButton(onPressed: (){
                Get.updateLocale(Locale('hi' , 'IN'));
              }, child: Text("Hindi")),

            ],
          )
        ],
      ),
    )
    ;
  }
}
