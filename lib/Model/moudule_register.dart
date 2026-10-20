class ModuleRegister {
  late final dynamic name;
  late final dynamic email;
  late final dynamic id;
  late final dynamic token;

  ModuleRegister(
      {required this.name,
      required this.email,
      required this.id,
      required this.token});
  factory ModuleRegister.formJson(dynamic jsonData) {
    return ModuleRegister(
      id: jsonData['id'],
      name: jsonData['name'],
      email: jsonData['email'],
      token: jsonData['token'],
    );
  }
}
