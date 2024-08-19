import 'package:flutter/material.dart';
import 'package:store_app_news/models/product_model.dart';
import 'package:store_app_news/services/ger_all-products_service.dart';
import 'package:store_app_news/widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static String id = 'HomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('New Trend'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 80),
        child: FutureBuilder<List<ProductModel>>(
          future: AllProductService().getAllproduct(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ProductModel> products=snapshot.data!;
              return GridView.builder(
                clipBehavior: Clip.none,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 100,
                  childAspectRatio: 1.5,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return  CustomCard(productModel: products[index],);
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}