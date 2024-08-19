import 'package:flutter/material.dart';
import 'package:store_app_news/models/product_model.dart';
import 'package:store_app_news/screens/show_product_page.dart';
import 'package:store_app_news/screens/update_product_page.dart';

// ignore: must_be_immutable
class CustomCard extends StatelessWidget {
  ProductModel productModel;
   CustomCard({super.key, 
    required this.productModel
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ShowProductPage.id,arguments: productModel);
      },
      onLongPress: () {
        Navigator.pushNamed(context, UpdateProductPage.id,arguments: productModel);
      },
      child: Card(
        elevation: 14,
        child: Stack(
                    //اظهار الجزء المخفي
                    clipBehavior: Clip.none,
                    children: [
                        Card(
                          // elevation: 10,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                            
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(productModel.title.substring(0,7),style:const TextStyle(fontSize: 22,color: Colors.grey),),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(r"$" '${productModel.price.toString()}'),
                                    IconButton(onPressed: (){}, icon:const Icon(Icons.favorite)),
                            
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                
                      Positioned(
                        right: 40,
                        top: -90,
                        child: Image.network(productModel.image,height: 100,width: 100,)
                      ),
                    ],
                  ),
      ),
    );
  }
}