import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nile_shipping/models/product_model.dart';
import 'package:nile_shipping/services/database_service.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nile_shipping/Pages/product_controller.dart';
import 'dart:core';
import 'package:nile_shipping/services/storage_services.dart';

class NewProductScreen2 extends StatefulWidget {
  const NewProductScreen2({Key? key}) : super(key: key);

  @override
  State<NewProductScreen2> createState() => _NewProductScreen2State();
}

class _NewProductScreen2State extends State<NewProductScreen2> {
  final ProductController productController = Get.find();
  StorageService storage = StorageService();
  DatabaseService database = DatabaseService();

  XFile? _image;
  Future pickImage() async {
    try {
      // FilePickerResult? result = await await FilePicker.platform.pickFiles(
      //   allowMultiple: true,
      //   allowCompression: true,
      //   type: FileType.any,
      // );

      ImagePicker _picker = ImagePicker();
      final _image = await _picker.pickImage(source: ImageSource.gallery );

      if (_image == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("No image was selected"),
          ),
        );
      }
      if (_image != null) {
        await storage.uploadImage(_image);
        var imageUrl = await storage.getDownloadURL(_image.name);
        productController.newProduct
            .update('imageUrl', (_) => imageUrl, ifAbsent: () => imageUrl);
      }

    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a Product'),
        foregroundColor: Colors.black,
        actions: [
          ElevatedButton(
            onPressed: () {
              database.addProduct(Product(
                id: int.parse(productController.newProduct['id']),
                name: productController.newProduct['name'],
                category: productController.newProduct['category'],
                description: productController.newProduct['description'],
                imageUrls: productController.newProduct['imageUrl'],
                isRecommended: productController.newProduct['isRecommended'],
                isPopular: productController.newProduct['isPopular'],
                price: productController.newProduct['price'],
                quantity: productController.newProduct['quantity'],
              ));
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
            ),
            child: const Text(
              'save',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
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
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _image != null
                    ? Image.file(File(_image!.path),
                        width: 350, height: 350, fit: BoxFit.fill)
                    : SizedBox(
                        height: 350,
                        width: 350,
                        child: InkWell(
                          onTap: () {
                            pickImage();
                          },
                          child: const Card(
                            margin: EdgeInsets.zero,
                            color: Colors.black,
                            child: Center(
                              child: Text(
                                'Add a New image',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
