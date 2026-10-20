import 'package:shefaa/Model/apiapi.dart';
import 'package:shefaa/Model/loginandsingup.dart';
import 'package:shefaa/Model/modul_myorder.dart';

class GetOneOrderService {
  Future<List<Modul_myorder>> getallmyOrdersService() async {
    Map<String, String> token1 = {
      "Admin_Auth": "warehouseAdmin123",
    };
    dynamic data = await Api().get(
      url: 'http://$host1:8000/api/view_orders',
            token: token,

      headers: {'Authorization': 'Bearer $token'},
    
    );

    List<Modul_myorder> Proudectlist = data
        .map((e) => Modul_myorder.formJson(e))
        .cast<Modul_myorder>()
        .toList();
    print(Proudectlist.toString());

    return Proudectlist;
  }
}

//     List<ModuleMedicine> Proudectlist = data
//         .map((e) => ModuleMedicine.formJson(e))
//         .cast<ModuleMedicine>()
//         .toList();
//
//     return Proudectlist;