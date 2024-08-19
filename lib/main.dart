import 'package:flutter/material.dart';
import 'package:store_app_news/screens/home_page.dart';
import 'package:store_app_news/screens/show_product_page.dart';
import 'package:store_app_news/screens/update_product_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomePage.id,
      routes: {
        HomePage.id:(context) =>const  HomePage(),
        UpdateProductPage.id:(context) => UpdateProductPage(),
        ShowProductPage.id: (context)=>const ShowProductPage(),
      },
    );
  }
}