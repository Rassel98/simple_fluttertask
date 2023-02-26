
class FoodModel {
  late String name;
  late num price;
  late String image;
  late String des;


  FoodModel(this.name, this.price, this.image, this.des);

  factory FoodModel.fromMap(Map<String, dynamic> map) =>
      FoodModel(
        map['name'],
        map['price'],
        map['image'],
        map['des'],
      );

}