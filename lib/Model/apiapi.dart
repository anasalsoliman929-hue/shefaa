import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shefaa/Model/loginandsingup.dart';

Map<String, dynamic> inFormation = {};


class Api {

Future<dynamic> get(
      {required String url,
      @required String? token,
      required dynamic headers}) async {
    Map<String, String> headers1 = {};
    if (token != null) {
      headers1.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response =
     await http.get(
      Uri.parse(url),
      headers: headers1,
    );
    print(url);
    if (response.statusCode == 200) {
      print('ok');
      List<dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      print('no');
      throw Exception('there is a problem1 in  code and response.statusCode:'
          ' ${response.statusCode} ');
    }
  }






  // Future<dynamic> get(
  //     {required String url,
  //     @required String? token,
  //     required dynamic headers}) async {
  //   Map<String, String> headers1 = {};
  //   if (token == null) {
  //     headers.addAll({'Authorization': 'Bearer $token'});
  //  }
  //   http.Response response = await http.get(
  //     Uri.parse(url),

  //     headers: {'Authorization': 'Bearer $token'},
  //   );
  //   print(' url');
  //   if (response.statusCode == 200) {
  //     print('ok');
  //     List<dynamic> data = jsonDecode(response.body);

  //     return data;
  //   } else {
  //     print('no');

  //     throw Exception('there is a problem1 in  code and response.statusCode:'
  //         ' ${response.statusCode} ');
  //   }
  // }

  Future<dynamic> postrigester({
    required url,
    required dynamic body,
  }) async {
    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
    } else {
      throw Exception(
          '${jsonDecode(response.body)} there is a problem1 in  code and response.statusCode:'
          ' ${response.statusCode} ');
    }
  }

  Future<dynamic> post(
      {required url, required dynamic body, @required dynamic token}) async {
    
    http.Response response = await http.post(
      Uri.parse(url),
      body: body,


      headers :{'Authorization': 'Bearer $token'},
      
    );

if(response.statusCode == 201){
        dynamic data = jsonDecode(response.body);

   return data;}
    if (response.statusCode == 201 ||response.statusCode == 222||response.statusCode == 401|| response.statusCode == 402|| response.statusCode == 422 ) {
      dynamic data = jsonDecode(response.body);
      print("object");
      return data;
    } else {
      throw Exception(
          '${jsonDecode(response.body)} there is a problem1 in  code and response.statusCode:'
          ' ${response.statusCode} ');
    }
  }

  Future<dynamic> postLogout({required url, required dynamic token}) async {
    http.Response response = await http.post(
      Uri.parse(url),
      headers: token,
    );

    if (response.statusCode == 200) {
    } else {
      throw Exception(
          '${jsonDecode(response.body)} there is a problem1 in  code and response.statusCode:'
          ' ${response.statusCode} ');
    }
  }

  void delete(
      {required int Id, required String url, @required String? token}) async {
    if (await getOneHelper(Id: Id, url: url, token: token)) {
      await http.delete(
        // Todo Todo
        Uri.parse(url),
      );
      print(' delete ok');
    } else {
      print(' I didnt delete');
    }
  }

  Future<bool> getOneHelper(
      {required String url, required int Id, @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    http.Response response = await http.get(
        Uri.parse('//$host1:8000/api/admin/medicine/$Id'),
        headers: headers);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<dynamic> put(
      {required url, @required dynamic body, @required String? token}) async {
    ////////////////
    Map<String, String> headers = {};
    ////////////////////
    headers.addAll({'Content-Type': 'application/x-www-form-urlencoded'});
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          '${jsonDecode(response.body)} there is a problem1 in  code and response.statusCode:'
          ' ${response.statusCode} ');
    }
  }
}
