import 'dart:convert';

import 'package:shefaa/Model/apiapi.dart';
import 'package:shefaa/Model/loginandsingup.dart';
import 'package:shefaa/Model/moudel_proudectmidicen.dart';

class Like {
  get http => null;

  Future<List<ModuleMedicine>> getAllLikeMedicinesService() async {
    dynamic data = await Api().get(
        //{{host}}/api/liked_medicines
        url: 'http://$host1:8000/api/liked_medicines',
        headers: {'Authorization': 'Bearer $token'},
        token: token);

    List<ModuleMedicine> Proudectlist = data
        .map((e) => ModuleMedicine.formJson(e))
        .cast<ModuleMedicine>()
        .toList();

    return Proudectlist;
  }

//{{host}}/api/dislike/5

  Future<void> addLike(
      {required String IdLike,
      }) async {
             get(
    ) async {
   
 
     await http.get(
      Uri.parse( 'http://$host1:8000/api/like/$IdLike',),
      headers:{'Authorization': 'Bearer $token'},
    );
    
    
  }

  Future<void> deleteLike({required dynamic IdLikedelete}) async {
    await Api().get(
        //{{host}}/api/dislike/5
        url: 'http://$host1:8000/api/dislike/$IdLikedelete',
        headers: {'Authorization': 'Bearer $token'},
        token: token);
  }
}
//{{host}}/api/medicine/categories
}