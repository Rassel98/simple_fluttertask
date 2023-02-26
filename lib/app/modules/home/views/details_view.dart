import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_task/app/data/food_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model=ModalRoute.of(context)!.settings.arguments as FoodModel;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl:  model.image,
              imageBuilder: (context, imageProvider) =>
                  Container(
                decoration: BoxDecoration(

                  ),
                    child:   ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        model.image,
                        fit: BoxFit.fill,
                        height: 240,
                        width: Get.width ,
                      ),
                    ),

              ),
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            SizedBox(height: 10,),
            Text(model.name,style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 10,),
            Text( '৳ ${model.price ?? ""}',style: TextStyle(color: Colors.red,fontSize: 22 ),),
            SizedBox(height: 10,),

            Text(model.des,style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold
            ),)
          ],
        ),
      ),
    );
  }
}
