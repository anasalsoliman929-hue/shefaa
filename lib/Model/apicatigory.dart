import 'package:shefaa/Model/apiapi.dart';
import 'package:shefaa/Model/loginandsingup.dart';

class apicatigory {
  Future<List> getAllLikeMedicinesService() async {
    dynamic data = await Api().get(
        url: 'http://$host1:8000/api/medicine/categories',
        headers: {'Authorization': 'Bearer $token'},
        token: token);

    List<dynamic> listcatigory = data.toList();
    // .map((e) => ModuleMedicine.formJson(e))
    // .cast<ModuleMedicine>()
    //.toList();

    return listcatigory;
  }
}
