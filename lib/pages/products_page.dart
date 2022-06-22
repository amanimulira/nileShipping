import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nile_shipping/dot_slider.dart';
import 'package:nile_shipping/models/product_model.dart';
import 'package:nile_shipping/pages/product_view_page.dart';
import 'package:nile_shipping/product_controller.dart';

class ProductsPage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            const SliverAppBar(
              expandedHeight: 50,
              floating: false,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(
                    "Add delivery address",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.normal),
                  )),
              backgroundColor: Color.fromARGB(100, 58, 210, 164),
            ),
          ];
        },
        body: Column(
          children: [
            Expanded(
              child: Obx(
                (() => Scrollbar(
                      child: ListView.builder(
                        itemCount: productController.products.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                height: 120,
                                width: double.maxFinite,
                                child: ProductCard(
                                  product: productController.products[index],
                                  index: index,
                                ),
                              ),
                              SizedBox(
                                height: 120,
                                width: double.maxFinite,
                                child: ProductCard(
                                  product: productController.products[index],
                                  index: index,
                                ),
                              ),
                              SizedBox(
                                height: 120,
                                child: ProductCard(
                                  product: productController.products[index],
                                  index: index,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Scrollbar(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 414,
                                        child: ProductCard1(
                                          product:
                                              productController.products[index],
                                          index: index,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 414,
                                        child: ProductCard1(
                                          product:
                                              productController.products[index],
                                          index: index,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 414,
                                        child: ProductCard1(
                                          product:
                                              productController.products[index],
                                          index: index,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  final int index;

  ProductCard({
    Key? key,
    required this.product,
    required this.index,
  }) : super(key: key);

  final ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext _context) =>
                    ProductViewPage(index: index)));
      },
      child: SizedBox(
          child: DecoratedBox(
        decoration: BoxDecoration(color: Color.fromARGB(179, 255, 255, 255)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.network(
                    product.imageUrls.toString(),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2),
                    child: Text(
                      '${product.name} ',
                      maxLines: 1,
                      style: const TextStyle(
                          fontSize: 18,
                          height: -1,
                          color: Colors.black,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  Text(
                    'Price: ${product.price}',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ])
          ],
        ),
      )),
    );
  }
}

class ProductCard1 extends StatelessWidget {
  final Product product;
  final int index;

  ProductCard1({
    Key? key,
    required this.product,
    required this.index,
  }) : super(key: key);

  final ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext _context) =>
                    ProductViewPage(index: index)));
      },
      child: SizedBox(
          child: DecoratedBox(
              decoration:
                  BoxDecoration(color: Color.fromARGB(179, 255, 255, 255)),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: SizedBox(
                              width: 400,
                              height: 400,
                              child: Image.network(
                                product.imageUrls.toString(),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ])
                  ],
                ),
              ))),
    );
  }
}
