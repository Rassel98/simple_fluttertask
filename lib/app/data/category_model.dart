class CategoryModel{
  late String name;
  late num id;



  CategoryModel(this.name, this.id,);

  factory CategoryModel.fromMap(Map<String, dynamic> map) =>
      CategoryModel(
        map['name'],
        map['id']
      );
}