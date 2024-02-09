

import 'dart:convert';

import 'package:carsapp/model/model.dart';
import 'package:http/http.dart' as http;

class PostApiservice
{
  Future<dynamic>sentData(
      String cname,
      String cmodel,
      String cprice,
      String cmileage
      )
  async{
    var client=http.Client();
    var apiurl=Uri.parse("http://localhost:3001/api/car/add");
    var response=await client.post(apiurl,
        headers: <String,String>{
          "Content-Type":"application/json; charset=UTF-8"
        },
        body: jsonEncode(<String,String>{


          "Name": cname,
          "Mobile": cmodel,
          "Symptoms": cprice,
          "Status": cmileage,


        })


    );
    if(response.statusCode==200)
    {
      return json.decode(response.body);
    }
    else{
      throw Exception("failure");
    }

  }
  Future <List<Posts>> getPost() async{
    var Client=http.Client();
    var apiurl=Uri.parse("http://localhost:3001/api/car/view");
    var response=await Client.get(apiurl);
    if(response.statusCode==200)
    {
      var resp=response.body;
      return postsFromJson(response.body);
    }
    else{
      return[];
    }

  }

}