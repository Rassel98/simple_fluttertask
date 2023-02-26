import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../data/food_model.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final _allFood = <FoodModel>[].obs;
  List<FoodModel> get allFood => _allFood;

  final FirebaseFirestore _db = FirebaseFirestore.instance;


  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
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
}
