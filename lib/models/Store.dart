class StoreModel {
  String id;
  String name;
  String street;
  String image;

  StoreModel(
    id,
    name,
    street,
    image,
  );

  StoreModel.fromMappedJson(dynamic json)
      : id = json['id'],
        name = json['name'],
        street = json['street'],
        image = json['image'];
}
