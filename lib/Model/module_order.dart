class ModuleOrder {
  late final dynamic id;
  late final dynamic user_id;
  late final dynamic total_price;
  late final dynamic paid;
  late final dynamic user_name;
  late final dynamic status;
  ModuleOrder(
      {required this.status,
      required this.user_id,
      required this.paid,
      required this.total_price,
      required this.id,
      required this.user_name});
  factory ModuleOrder.formJson(dynamic jsonData) {
    return ModuleOrder(
      id: jsonData['id'],
      status: jsonData['status'],
      user_id: jsonData['user_id'],
      paid: jsonData['paid'],
      total_price: jsonData['total_price'],
      user_name: jsonData['user_name'],
    );
  }
}

// class Order {
//   final int id;
//   final int userId;
//   final String userName;
//   final String totalPrice;
//   final String status;
//   final int paid;
//
//   Order({
//     required this.id,
//     required this.userId,
//     required this.userName,
//     required this.totalPrice,
//     required this.status,
//     required this.paid,
//   });
//
//   factory Order.fromJson(Map<String, dynamic> json) {
//     return Order(
//       id: json['id'],
//       userId: json['user_id'],
//       userName: json['user_name'],
//       totalPrice: json['total_price'],
//       status: json['status'],
//       paid: json['paid'],
//     );
//   }
// }

// List<Order> orders = (jsonDecode(responseJson)['data'] as List)
//     .map((json) => Order.fromJson(json))
//     .toList();

//
// ListView.builder(
// itemCount: orders.length,
// itemBuilder: (context, index) {
// Order order = orders[index];
// return ListTile(
// title: Text('Order ID: ${order.id}'),
// subtitle: Text('User: ${order.userName}'),
// trailing: Text('Status: ${order.status}'),
// );
// },
//)
