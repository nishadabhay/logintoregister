import 'package:flutter/material.dart';
import 'package:lession1/ModelClass/single_post_model.dart';
import 'package:lession1/api_services.dart';

class Mycamera extends StatefulWidget {
  const Mycamera({super.key});

  @override
  State<Mycamera> createState() => _MycameraState();
}

class _MycameraState extends State<Mycamera> {


  bool isReady = false;
   SinglePostModel singlePostModel = SinglePostModel();
  _getSinglePost(){
    isReady = true;
    ApiServices().getSinglePostwithModel().then((value){

      setState(() {
        singlePostModel = value!;
        isReady = false;

      });
    }).onError((error, stackTrace){
      print(error);
      setState(() {
        isReady = false;
      });
    });
  }
  @override
  void initState() {
       _getSinglePost();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text("Single"),


      ),
      body: isReady == true?
         const Center(child: CircularProgressIndicator(),):Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(singlePostModel.userId.toString(), style:  TextStyle(fontSize: 20, color: Colors.blue),),
          Text(singlePostModel.title.toString(), style:  TextStyle(fontSize: 20, color: Colors.deepOrange),),
          Text(singlePostModel.body.toString(), style:  TextStyle(fontSize: 20, color: Colors.blue),),


        ],

      )
    );
  }
}
