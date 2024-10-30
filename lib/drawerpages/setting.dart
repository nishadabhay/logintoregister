import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import '../ModelClass/PostModel.dart';

class MySetting extends StatefulWidget {
  const MySetting({super.key});

  @override
  State<MySetting> createState() => _MySettingState();
}

class _MySettingState extends State<MySetting> {
  List<PostModel> postList = [];
  Future<List<PostModel>> getApi ()async {

    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var data = jsonDecode(response.body.toString());

    if(response.statusCode == 200){
      for(Map i in data){
        postList.add(PostModel.fromJson(i));
      }
      return postList;

    }else{
      return postList;

    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("GET APi")),),

      body: Container(
        child: Column(
          children: [

            Expanded(
              child: FutureBuilder(
                future: getApi(),
                builder: (context, snapshot){
                  if(!snapshot.hasData ){
                    return Text("Loading");

                  }else{
                    return ListView.builder(
                        itemCount: postList.length,
                        itemBuilder: (context, index){
                          return Card(
                            child: Column(
                              children: [
                                Text(postList[index].id.toString()),
                                Text(postList[index].userId.toString()),
                                Text(postList[index].title.toString()),
                                Text(postList[index].body.toString()),
                              ],
                            ),
                          );
                        });

                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
