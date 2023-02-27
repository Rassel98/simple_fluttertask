class FoodModel {
  late String? name;
  late num? price;
  late num? catId;
  late String? image;
  late String? des;

  FoodModel({this.name, this.price, this.catId, this.image, this.des});

  factory FoodModel.fromMap(Map<String, dynamic> map) => FoodModel(
      name: map['name'],
      price: map['price'],
      image: map['image'],
      des: map['des'],
      catId: map['catid']);
}
