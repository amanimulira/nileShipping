import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'cart_controller.dart';

class CartTotal extends StatelessWidget {
  final CartController controller = Get.put(CartController());
  CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.isBlank == true
        ? Obx(
            () => Container(
                padding: const EdgeInsets.symmetric(horizontal: 75),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total:",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      '${controller.total}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.normal,
                      ),
                    )
                  ],
                )),
          )
        : Container(
            padding: const EdgeInsets.symmetric(horizontal: 75),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("cart is empty",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.normal,
                      ))
                ]));
  }
}
