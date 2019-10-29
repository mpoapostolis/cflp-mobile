class StoreModel {
  String id;
  String name;
  String street;
  String image;
  int meters;

  StoreModel({this.id, this.name, this.street, this.image, this.meters});
  StoreModel.fromMappedJson(dynamic json)
      : id = json['id'],
        name = json['name'],
        street = json['street'],
        image = json['image'],
        meters = json['meters'];
}
