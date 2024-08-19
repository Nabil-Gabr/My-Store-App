

import 'package:store_app_news/helper/api.dart';
import 'package:store_app_news/models/product_model.dart';

class AllProductService {

  Future<List<ProductModel>> getAllproduct()async{
    List<dynamic> data = await Api().get(url: 'https://fakestoreapi.com/products');

    List<ProductModel> productsList=[];

    for (int i = 0; i < data.length; i++) {
      productsList.add(ProductModel.fromJson(data[i]));
    }

    return productsList;
  }
  
}