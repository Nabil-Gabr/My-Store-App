import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app_news/services/update_product.dart';
import 'package:store_app_news/widgets/custom_button.dart';
import 'package:store_app_news/widgets/custom_textfield.dart';

import '../models/product_model.dart';

class UpdateProductPage extends StatefulWidget {

  const UpdateProductPage({super.key});

  static String id='UpdateProductPage';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName,description,image,price;
  // num? price;

  bool isLoading=false;

  @override
  Widget build(BuildContext context) {
    ProductModel produdt=ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title:const Text("Update Product",style: TextStyle(fontWeight: FontWeight.bold),),
          // centerTitle: true,
        ),
      
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50,),
                CustomTextField(
                  obscureText: false, 
                  enabledColor: Colors.grey, 
                  focusedColor: Colors.black,
                  labelText: 'ProductName',
                  onChanged: (data) {
                    productName=data;
                  },),
                const SizedBox(height: 16,),
            
                CustomTextField(
                  obscureText: false, 
                  enabledColor: Colors.grey, 
                  focusedColor: Colors.black,
                  labelText: 'description',
                  onChanged: (data) {
                    description=data;
                  },),
                const SizedBox(height: 16,),
            
                CustomTextField(
                  inputType: TextInputType.number,
                  obscureText: false, 
                  enabledColor: Colors.grey, 
                  focusedColor: Colors.black,
                  labelText: 'price',
                  onChanged: (data) {
                    price=data;
                  },),
                const SizedBox(height: 16,),
            
                CustomTextField(
                  obscureText: false, 
                  enabledColor: Colors.grey, 
                  focusedColor: Colors.black,
                  labelText: 'image',
                  onChanged: (data) {
                    image=data;
                  },),
                const SizedBox(height: 16,),
            
                const SizedBox(
                  height: 130,
                ),
                CustomButton(
                  titleBurron: 'Update', 
                  colorContainer: Colors.white, 
                  colortitleButton: Colors.black, 
                  colorborderSide: Colors.black, 
                  onTap: () async{
                    isLoading=true;
                    setState(() {});
                    
                    try {
                      await updateProductMothed(produdt);
                      
                      Navigator.pop(context);
                    } catch (e) {
                      print(e.toString());
                    }

                    isLoading=false;
                    setState(() {});
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProductMothed(ProductModel produdt) async{
    await UpdateProduct().updateProduct(
        id: produdt.id,
        title: productName==null ? produdt.title : productName!,
        price: price==null ? produdt.price.toString() : price!,
        description: description!,
        image: image!,
        category: produdt.category);
  }
}