import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nile_shipping/models/product_model.dart';
import 'package:nile_shipping/Pages/product_view_page.dart';
import 'package:nile_shipping/Pages/product_controller.dart';

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
                    ProductViewPage(index: index),
                    // name =view name you want to see in Analytics
                settings: RouteSettings(name: "Product Page ( details )")));
      },
      child: SizedBox(
          child: DecoratedBox(
        decoration: BoxDecoration(color: Color.fromARGB(179, 255, 255, 255)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
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

class ProductCard2 extends StatelessWidget {
  final Product product;
  final int index;

  const ProductCard2({
    Key? key,
    required this.product,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: DecoratedBox(
      decoration: BoxDecoration(color: Color.fromARGB(179, 255, 255, 255)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${product.category} ',
            maxLines: 1,
            style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.normal),
          ),
          SizedBox(
            height: 410,
            child: GridView.count(
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              children: List.generate(4, (index1) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext _context) =>
                                  ProductViewPage(index: index)));
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2),
                          child: Text(
                            '${product.name} ',
                            maxLines: 1,
                            style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          height: 150,
                          child: Image.network(
                            product.imageUrls.toString(),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
            child: Text(
              'explore more ... [ future text button]',
              maxLines: 1,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.normal),
            ),
          ),
        ],
      ),
    ));
  }
}
