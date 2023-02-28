class ItemsModel {
  late String? name;
  late num? price;
  late num? catId;
  late String? image;
  late String? des;

  ItemsModel({this.name, this.price, this.catId, this.image, this.des});

  factory ItemsModel.fromMap(Map<String, dynamic> map) => ItemsModel(
      name: map['name'],
      price: map['price'],
      image: map['image'],
      des: map['des'],
      catId: map['catid']);
}
