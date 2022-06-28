import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nile_shipping/Cart/cart_controller.dart';
import 'package:get/get.dart';
import 'package:nile_shipping/Search/search_bar.dart';
import 'product_controller.dart';

class ProductViewPage extends StatelessWidget {
  final int index;
  final cartController = Get.put(CartController());

  ProductViewPage({
    Key? key,
    required this.index,
  }) : super(key: key);

  final ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SearchBar(),
        titleTextStyle: const TextStyle(
          color: Colors.black,
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Color.fromARGB(145, 22, 156, 116),
                  Color.fromARGB(145, 58, 210, 164)
                ]),
          ),
        ),
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text(
                productController.products[index].name,
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 400,
                width: 400,
                child: Container(
                  child: Image.network(
                    productController.products[index].imageUrls.toString(),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Center(
                child: Row(
                  children: const [
                    Text("Qty: "),
                    MyStatefulWidget(),
                  ],
                ),
              ),
              Center(
                  child: SizedBox(
                      width: 200,
                      child: TextButton(
                          onPressed: () {
                            HapticFeedback.heavyImpact();
                            cartController
                                .addProduct(productController.products[index]);
                          },
                          style: TextButton.styleFrom(
                            primary: Colors.black,
                            backgroundColor: Colors.lime,
                          ),
                          child: const Text(
                            "add to card",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.normal),
                          )))),
              Center(
                  child: SizedBox(
                      width: 200,
                      child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            primary: Colors.black,
                            backgroundColor: Colors.blueGrey,
                          ),
                          child: Text(
                            "buy now",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.normal),
                          )))),
              Text(
                  "description: this will be a description of the selected items etc... words words wlahjf;alkjd lajlf;kjadl fjhda; ldkj a;a df;al kjf;lajhtw;lkjaldkjf;alkrth;alhkd;kgjahflgha;jh;altkj ;gjh;r ha;ljhg;kajh;flkjhauh4; jfh;aj jghapgjhpjwnfbjahp pgh;a jfghpaurhgp ojfpiuajhuhrg;ojhrbjn;jhw;uht prjg;kjh ogjhpaorug;orakjngpajngpunbpajhrpugapogjnfpijanpiurn ujnpjagprowghro;hrojghpirujnapujgtpoguhapgunfpgaojrp gutpaogjnfpgajnvojgnrpaguhrpty;o tu u rpogah opghapoj gpojvjaghpiutclose sbajwpoth akjhgporjh aouthrpagjnj rtha;ljgh ;jgha rj ah;jghrpwugh ajsnfv;kjahtpou ajhg jahr;ojhtpawirjh ijgiajh rg;jahwpgij hksjhgrougharpogjpjfa egpij egpijhbapjhergpjrhapiuhgpajhrgprjahgp4uhgpajfhb rjghapieughpij jfniajnbiugihueprouitgrpogijnv;jbnt84yt9unfkjgnp sj jergh;ajefh pujd; lja;lfjhatkljrhg;ajlhcv; ljahg;lj a;j; ahw;lrkjhg;al jh;"),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    SizedBox.square(
                      dimension: 200,
                      child: Card(
                        color: Colors.green,
                        child: Center(
                          child: Text(
                            'index 1',
                            style: TextStyle(color: Colors.white),
                          ), //Text
                        ), //Center
                      ), //Card
                    ),
                    SizedBox.square(
                      dimension: 200,
                      child: Card(
                        color: Colors.green,
                        child: Center(
                          child: Text(
                            'index 1',
                            style: TextStyle(color: Colors.white),
                          ), //Text
                        ), //Center
                      ), //Card
                    ),
                    SizedBox.square(
                      dimension: 200,
                      child: Card(
                        color: Colors.green,
                        child: Center(
                          child: Text(
                            'index 1',
                            style: TextStyle(color: Colors.white),
                          ), //Text
                        ), //Center
                      ), //Card
                    ),
                    SizedBox.square(
                      dimension: 200,
                      child: Card(
                        color: Colors.green,
                        child: Center(
                          child: Text(
                            'index 1',
                            style: TextStyle(color: Colors.white),
                          ), //Text
                        ), //Center
                      ), //Card
                    ),
                    SizedBox.square(
                      dimension: 200,
                      child: Card(
                        color: Colors.green,
                        child: Center(
                          child: Text(
                            'index 1',
                            style: TextStyle(color: Colors.white),
                          ), //Text
                        ), //Center
                      ), //Card
                    )
                  ],
                ),
              ),
              const SizedBox.square(
                dimension: 400,
                child: Card(
                  color: Colors.green,
                  child: Center(
                    child: Text(
                      'index 1',
                      style: TextStyle(color: Colors.white),
                    ), //Text
                  ), //Center
                ), //Card
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int dropdownValue = 1;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      value: dropdownValue,
      icon: const Icon(Icons.drag_handle_rounded),
      elevation: 16,
      style: const TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.blue,
      ),
      onChanged: (int? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <int>[1, 2, 3, 4].map<DropdownMenuItem<int>>((int value) {
        return DropdownMenuItem<int>(
          value: value,
          child: Text('${value}'),
        );
      }).toList(),
    );
  }
}
