import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_task/app/data/category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'details_view.dart';

class AllItemDetails extends StatelessWidget {
  const AllItemDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = ModalRoute.of(context)!.settings.arguments as CategoryModel;
    final controller = Get.find<HomeController>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      backgroundColor: Color(0xffF6F6F6),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.getsearchFood(model.id).length,
          itemBuilder: (context, index) {
            final itemModel = controller.getsearchFood(model.id)[index];
            return GestureDetector(
              onTap: () =>
                  Get.to(() => const ItemDetails(), arguments: itemModel),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 10, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CachedNetworkImage(
                      imageUrl: itemModel.image!,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            itemModel.image!,
                            fit: BoxFit.fill,
                            height: Get.height * 0.2693,
                            width: Get.width,
                          ),
                        ),
                      ),
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      itemModel.name!,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '৳ ${itemModel.price ?? ""}',
                      style: TextStyle(color: Colors.red, fontSize: 22),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      itemModel.des!,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
