import 'package:flutter/material.dart';
import 'package:store_app_news/models/product_model.dart';

class ShowProductPage extends StatelessWidget {
  const ShowProductPage({super.key});
  
  static String id='ShowProductPage';
  @override
  Widget build(BuildContext context) {
    ProductModel produdt=ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
      appBar: AppBar(title: const Text('Details',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(produdt.image,width: double.infinity,height: 200,),
            const SizedBox(height: 12,),
            Text( r'$' '${produdt.price.toString()}',style: const TextStyle(fontSize: 22,color: Colors.black),),
            const SizedBox(height: 8,),
            Text(produdt.title,style: const TextStyle(fontSize: 22,color: Colors.black),),
            const SizedBox(height: 8,),
            Text(produdt.description,style: const TextStyle(fontSize: 16,color: Colors.grey),),
            
          ],
        ),
      ),
    );
  }
}