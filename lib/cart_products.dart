import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nile_shipping/cart_controller.dart';
import 'package:nile_shipping/pages/product_view_page.dart';
import 'cart_total.dart';
import 'models/product_model.dart';

class CartProducts extends StatelessWidget {
  final CartController controller = Get.put(CartController());
  CartProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Center(
                child: Column(children: [
      CartTotal(),
      Center(
          child: SizedBox(
              width: 200,
              child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                    backgroundColor: Colors.lime,
                  ),
                  child: Text(
                    "check out",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                  )))),
      Obx(
        () => SizedBox(
          height: 500,
          child: ListView.builder(
              itemCount: controller.products1.length,
              itemBuilder: (BuildContext context, int index) {
                return TextButton(
                  onPressed: (() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext _context) =>
                                ProductViewPage(index: index)));
                  }),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CardProductCard(
                        controller: controller,
                        product: controller.products1.keys.toList()[index],
                        quantity: controller.products1.values.toList()[index],
                        index: index),
                  ),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ))),
                );
              }),
        ),
      ),
    ]))));
  }
}

class CardProductCard extends StatelessWidget {
  final CartController controller;
  final Product product;
  final num quantity;
  final num index;
  const CardProductCard({
    Key? key,
    required this.controller,
    required this.product,
    required this.quantity,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 80,
          height: 80,
          child: Image.network(
            product.imageUrls.toString(),
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Text(
            product.name,
            style: TextStyle(color: Colors.black),
          ),
        ),
        IconButton(
            onPressed: () {
              controller.removeProduct(product);
            },
            icon: Icon(
              Icons.remove_circle,
              color: Colors.black,
            )),
        Text(
          '${quantity}',
          style: TextStyle(color: Colors.black),
        ),
        IconButton(
            onPressed: () {
              controller.addProduct(product);
            },
            icon: Icon(Icons.add_circle, color: Colors.black)),
      ],
    );
  }
}
