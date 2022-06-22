import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyWidget extends StatelessWidget {
  MyWidget({Key? key}) : super(key: key);
  final List<String> pushNamed = <String>[
    '/products/new_product_screen',
    'B',
    'C',
    'd'
  ];
  final List<String> textTitle = <String>[
    'add new product',
    'category #1',
    'category #2',
    'category #3',
    'category #4',
    'category #5',
    'category #6',
    'category #7',
    'category #8',
    'category #9',
    'category #10',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListViewBuilder(
        pushName: pushNamed,
        textTitle: textTitle,
      ),
    ));
  }
}

class ListViewBuilder extends StatelessWidget {
  final List<String> pushName;
  final List<String> textTitle;

  ListViewBuilder({
    Key? key,
    required this.pushName,
    required this.textTitle,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    height: 100,
                    child: Card(
                        margin: EdgeInsets.zero,
                        color: Colors.black,
                        child: Row(children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(pushName[index]);
                            },
                            icon: const Icon(
                              Icons.add_circle,
                              color: Colors.white,
                            ),
                          ),
                          Text(textTitle[index],
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white))
                        ]))),
              );
            }));
  }
}
