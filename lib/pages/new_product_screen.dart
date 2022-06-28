import 'package:flutter/material.dart';
import 'package:nile_shipping/services/database_service.dart';
import 'package:get/get.dart';
import 'package:nile_shipping/Pages/product_controller.dart';
import 'dart:core';
import 'package:nile_shipping/services/storage_services.dart';
import 'new_product_screen_p2.dart';
import 'package:nile_shipping/Widgets/new_data.dart';

class NewProductScreen extends StatefulWidget {
  const NewProductScreen({Key? key}) : super(key: key);

  @override
  State<NewProductScreen> createState() => _NewProductScreenState();
}

class _NewProductScreenState extends State<NewProductScreen> {
  final ProductController productController = Get.find();
  StorageService storage = StorageService();
  DatabaseService database = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Add a Product'),
          foregroundColor: Colors.black,
          leading: SizedBox(
            width: 200,
            child: TextButton(
              child: const Text(
                "cancel",
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          actions: [
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext _context) =>
                                const NewProductScreen2()));
                  },
                  child: const Icon(
                    Icons.navigate_next,
                    size: 26.0,
                  ),
                )),
          ]),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Obx(
          () => SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Product Information',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: buildTextFormField(
                    'Product ID',
                    'id',
                    productController,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: buildTextFormField(
                    'Product Name',
                    'name',
                    productController,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: buildTextFormField(
                    'Product Description',
                    'description',
                    productController,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: buildTextFormField(
                    'Product Category',
                    'category',
                    productController,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(height: 10),
                buildSlider('Price', 'price', productController,
                    productController.price),
                buildSlider(
                  'Quantity',
                  'quantity',
                  productController,
                  productController.quantity,
                ),
                const SizedBox(
                  height: 10,
                ),
                buildCheckbox(
                  'Recommended',
                  'isRecommended',
                  productController,
                  productController.isRecommended,
                ),
                buildCheckbox(
                  'popular',
                  'isPopular',
                  productController,
                  productController.isPopular,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
