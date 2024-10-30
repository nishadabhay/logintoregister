import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Myprofile extends StatefulWidget {
  const Myprofile({super.key});

  @override
  State<Myprofile> createState() => _MyprofileState();
}

class _MyprofileState extends State<Myprofile> {

  List<dynamic> jsonList = [];
  // var jsonList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData()async{
    try{
      var response = await Dio().get('https://jsonplaceholder.typicode.com/photos');
     if(response.statusCode == 200){
       setState(() {
         jsonList = response.data;
       });

     }else{
       print(response.statusCode);

     }

    }catch(e){

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "New APP API",
        )),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(itemBuilder: (BuildContext context, int index){
        return Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            
            children: [
              Text(jsonList[index]['albumId'].toString()),
              Text(jsonList[index]['id'].toString()),
              Text(jsonList[index]['title']),
              Text(jsonList[index]['id'].toString()),
              Image.network(jsonList[index]['url']),
            ],
          )
          // ListTile(
          //   title: Text(jsonList[index]['title']),
          //   subtitle: Text("item sub title"),
          // ),
          
        );
      },
      itemCount: jsonList == null?0:jsonList.length,
      )
    );
  }
}
