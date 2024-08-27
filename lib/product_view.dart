import 'package:api_call/product_controller.dart';
import 'package:api_call/welcome_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductView extends StatelessWidget {
  final ShopController shopController = Get.put(ShopController());

  ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: Center(
        child: Obx(() => ListView.builder(
              itemCount: shopController.products.length,
              itemBuilder: (context, index) {
                ShopItem product = shopController.products[index];
                return ListTile(
                  title: Text(product.title),
                  subtitle: Text(product.description),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('\$${product.price.toString()}'),
                      Text('Rating: ${product.rating.rate.toString()}'),
                    ],
                  ),
                );
              },
            )),
      ),
    );
  }
}