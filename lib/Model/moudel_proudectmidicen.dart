class ModuleMedicine {
  late final dynamic id;
  late final String scientificName;
  late final String commercialName;

  late final String category;
  late final String manufactureCompany;

  late final int availableQuantity;
  late final String expirationDate;
  late final String price;
  late final String image_url;
  ModuleMedicine(
      {required this.id,
      required this.scientificName,
      required this.commercialName,
      required this.category,
      required this.manufactureCompany,
      required this.availableQuantity,
      required this.expirationDate,
      required this.price,
      required this.image_url});
  factory ModuleMedicine.formJson(jsonData) {
    return ModuleMedicine(
      image_url: jsonData['image'],
      id: jsonData['id'],
      scientificName: jsonData['scientific name'],
      commercialName: jsonData['commercial name'],
      category: jsonData['category'],
      manufactureCompany: jsonData['manufacture company'],
      availableQuantity: jsonData['available quantity'],
      expirationDate: jsonData['expiration date'],
      price: jsonData['price'],
    );
  }
}
