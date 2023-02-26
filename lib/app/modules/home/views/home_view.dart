import 'package:firebase_task/app/data/food_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'details_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('HomeView',style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: Obx(() => controller.allFood.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 0.92,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemCount: controller.allFood.length,
              itemBuilder: (BuildContext ctx, index) {
                 FoodModel foodModel =
                 controller.allFood.elementAt(index);
                return InkWell(
                    onTap: () => Get.to(() => const ItemDetails(),arguments: foodModel),
                    child: Container(
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    //boxShadow: [Helpers.customBoxShadow()]
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          foodModel.image,
                          fit: BoxFit.fill,
                          width: Get.width * 0.47,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(

                          foodModel.name ?? "",
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                            bottom: 6,
                          ),
                          child: Text(

                            '৳ ${foodModel.price ?? ""}',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              //fontSize: CcdDimens.space16,
                              color: Color(0xffF5244F)
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ));
              })),
    );
  }
}