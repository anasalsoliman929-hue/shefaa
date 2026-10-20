import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shefaa/Model/apiapi.dart';
import 'package:shefaa/Model/apicatigory.dart';
import 'package:shefaa/Model/modul_myorder.dart';
import 'package:shefaa/Model/module_order.dart';
import 'package:shefaa/Model/moudel_proudectmidicen.dart';
import 'package:shefaa/Model/moudule_register.dart';
import 'package:shefaa/View/pages/pages/catigory.dart';

var host1 = "192.168.208.74";
late String? token = "";

class UeserLogin {
  Future<void> userRegister({
    required String name,
    required String email,
    required String password,
  }) async {
    Map<String, String> body = {
      "email": email,
      "password": password,
      "name": name,
    };

    dynamic data = await Api().post(
      url: 'http://$host1:8000/api/register',
      body: body,
    );
    ModuleRegister moduleRegister = ModuleRegister.formJson(data);
    token = moduleRegister.token;
    print(token);
  }

  Future<dynamic> UserLogin({
    required String email,
    required String password,
  }) async {
    Map<String, String> body = {
      "email": email,
      "password": password,
    };
    dynamic data = await Api().post(
      url: 'http://$host1:8000/api/login',
      body: body,
    );
    ModuleRegister moduleRegister = ModuleRegister.formJson(data);
    token = moduleRegister.token;

    return data;
  }

  Future<void> UserLogout({
    required String email,
    required String password,
  }) async {
    Map<String, String> body = {
      "email": email,
      "password": password,
    };
    await Api()
        .post(url: 'http://$host1:8000/api/logout', body: body, token: token);
  }

  Future<void> userPostOrder({required dynamic body}) async {
    print(body.toString());
    http.Response response = await http.post(
      Uri.parse('http://$host1:8000/api/order'),
      body: jsonEncode(body),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      },
    );
  }

  Future<List<ModuleMedicine>> getAllMedicinesService() async {
    List<dynamic> data = await Api().get(
      //Todo{{host}}/api/medicine
      url: 'http://$host1:8000/api/medicine',
      headers: {'Authorization': 'Bearer $token'},
      token: token,
    );

    if (true) {
      print('hasData purchasees');
    }
    List<ModuleMedicine> Proudectlist = data
        .map((e) => ModuleMedicine.formJson(e))
        .cast<ModuleMedicine>()
        .toList();

    return Proudectlist;
  }

  Future<ModuleMedicine> getOneMedicinesService({required int Id}) async {
    List<dynamic> data = await Api().get(
      //Todo
      url: '//$host1:8000/api/medicine/Id',
      headers: {'Authorization': 'Bearer $token'},
    );
    if (true) {
      print('hasData ModuleMedicine');
    }

    ModuleMedicine moduleMedicine = ModuleMedicine.formJson(data);
    return moduleMedicine;
  }


  Future<List<ModuleMedicine>> getAllMedicinesSearchOfName(
      {required String name}) async {
    List<dynamic> data = await Api().get(
//        url: 'http://$host1:8000/api/medicine',

      //{{host}}/api/medicine/search_name/para
      url: 'http://$host1:8000/api/medicine/search_name/$name',
      headers: {'Authorization': 'Bearer $token'},

      token: token,
      // headers: token
    );
    List<ModuleMedicine> Proudectlist = data
        .map((e) => ModuleMedicine.formJson(e))
        .cast<ModuleMedicine>()
        .toList();

    return Proudectlist;
  }

  Future<List<ModuleMedicine>> getAllMedicinesSearchOfCategory(
      {required String category}) async {
    List<dynamic> data = await Api().get(
      url: 'http://$host1:8000/api/medicine/search_category/$category',
      headers: {'Authorization': 'Bearer $token'},
      token: token,
    );

    List<ModuleMedicine> Proudectlist = data
        .map((e) => ModuleMedicine.formJson(e))
        .cast<ModuleMedicine>()
        .toList();

    return Proudectlist;
  }

  Future<List<ModuleOrder>> getAllOrder() async {
    List<dynamic> data = await Api().get(
      url: 'http://$host1:8000/api/view_orders',
      token: token,
      headers: {'Authorization': 'Bearer $token'},
    );

    List<ModuleOrder> Proudectlist =
        data.map((e) => ModuleOrder.formJson(e)).cast<ModuleOrder>().toList();

    return Proudectlist;
  }

  Future<List<Modul_myorder>> getOneOrder({required String id}) async {
    List<dynamic> data = await Api().get(
        url: 'http://$host1:8000/api/view_order/$id',
        headers: {'Authorization': 'Bearer $token'},
        token: token);

    List<Modul_myorder> Proudectlist = data
        .map((e) => Modul_myorder.formJson(e))
        .cast<Modul_myorder>()
        .toList();

    return Proudectlist;
  }
}

//{
//   "medicines": [
//     {"id": 5, "amount": 12},
//     {"id": 3, "amount": 3},
//     {"id": 4, "amount": 1},
//     {"id": 7, "amount": 2}
//   ]
// }
