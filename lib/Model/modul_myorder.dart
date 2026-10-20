class Modul_myorder {
  late final dynamic id;
  late final dynamic medicine_id;
  late final dynamic order_id;
  late final dynamic amount;
  late final dynamic medicine_name;
  late final dynamic commercial_name;
  late final dynamic cost;

  Modul_myorder({
    required this.id,
    required this.medicine_id,
    required this.amount,
    required this.medicine_name,
    required this.order_id,
    required this.commercial_name,
    required this.cost,
  });
  factory Modul_myorder.formJson(dynamic jsonData) {
    return Modul_myorder(
      id: jsonData["id"],
      medicine_id: jsonData["medicine_id"],
      amount: jsonData["amount"],
      medicine_name: jsonData["medicine_name"],
      order_id: jsonData["order_id"],
      commercial_name: jsonData["commercial_name"],
      cost: jsonData["cost"],
    );
  }
}

//        "id": 13,
//         "medicine_id": 5,
//         "order_id": 4,
//         "amount": 12,
//         "created_at": "2024-01-03T10:38:48.000000Z",
//         "updated_at": "2024-01-03T10:38:48.000000Z",
//         "medicine_name": "Zithromax"