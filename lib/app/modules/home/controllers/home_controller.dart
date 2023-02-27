import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../data/category_model.dart';
import '../../../data/food_model.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final _allFood = <FoodModel>[].obs;
  List<FoodModel> get allFood => _allFood;
  List<FoodModel>searchAll=[];

  final _allCategory = <CategoryModel>[].obs;
  List<CategoryModel> get allCategory => _allCategory;

  final FirebaseFirestore _db = FirebaseFirestore.instance;


  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();

   await getCategory();
   await getUsers();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


  Future<void> getUsers() async {
    final snapshot = await _db.collection('items').get();
    _allFood.value = List.generate(snapshot.docs.length,
            (index) => FoodModel.fromMap(snapshot.docs[index].data()));
  }
  Future<void> getCategory() async {
    final snapshot = await _db.collection('category').get();
    _allCategory.value = List.generate(snapshot.docs.length,
            (index) => CategoryModel.fromMap(snapshot.docs[index].data()));

  }


  List<FoodModel>getsearchFood(num id){
    searchAll.clear();
  for( var i in allFood){
    if(i.catId==id){
      searchAll.add(i);
    }
  }

   return searchAll;
  }
}
