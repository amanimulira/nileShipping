import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nile_shipping/Pages/product_controller.dart';
import '../Widgets/product_widgets.dart';

class ProductsPage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());



  ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              const SliverAppBar(
                expandedHeight: 45,
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
                  child: Obx((() => Scrollbar(
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
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                    height: 454,
                                    child: ProductCard2(
                                        product:
                                            productController.products[index],
                                        index: index)),
                                const SizedBox(
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
                                                product: productController
                                                    .products[index],
                                                index: index,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 414,
                                              child: ProductCard1(
                                                product: productController
                                                    .products[index],
                                                index: index,
                                              ),
                                            ),
                                            SizedBox(
                                                height: 414,
                                                child: ProductCard1(
                                                  product: productController
                                                      .products[index],
                                                  index: index,
                                                ))
                                          ],
                                        )))
                              ],
                            );
                          })))))
            ],
          )),
    );
  }
}
