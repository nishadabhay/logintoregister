import 'dart:convert';

import 'ModelClass/single_post_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  // api woith model

  Future<SinglePostModel?> getSinglePostwithModel() async {
    try {
      var url = Uri.parse("https://jsonplaceholder.typicode.com/posts/1");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        SinglePostModel model =
            SinglePostModel.fromJson(json.decode(response.body));
        return model;
      }
    } catch (e) {
      print("error data not found");
    }
  }



}
