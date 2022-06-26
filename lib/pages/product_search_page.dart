import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductSearchPage extends SearchDelegate {
  final CollectionReference _firebaseFirestore =
      FirebaseFirestore.instance.collection('products');

  @override
  String get searchFieldLabel => 'search ';

  @override
  TextStyle? get searchFieldStyle => const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.normal,
      );

  @override
  InputDecorationTheme? get searchFieldDecorationTheme =>
      const InputDecorationTheme(
          isDense: true,
          contentPadding: EdgeInsets.all(8),
          fillColor: Colors.grey,
          filled: true,
          constraints: BoxConstraints(maxHeight: 35, maxWidth: double.infinity),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4))));

  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[
      //SizedBox( height: 20, width: 20,
      //     child: IconButton(
      //         onPressed: () {
      //           query = "";
      //         },
      //         icon: const Icon(Icons.close, size: 20)),
      //   ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firebaseFirestore.snapshots().asBroadcastStream(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.data!.docs
                .where((QueryDocumentSnapshot<Object?> element) =>
                    element['name']
                        .toString()
                        .toLowerCase()
                        .contains(query.toLowerCase()))
                .isEmpty) {
              return const Center(
                child: Text('Nothing found'),
              );
            } else {
              // fetch data here
              return ListView(
                children: [
                  ...snapshot.data!.docs
                      .where((QueryDocumentSnapshot<Object?> element) =>
                          element['name']
                              .toString()
                              .toLowerCase()
                              .contains(query.toLowerCase()))
                      .map((QueryDocumentSnapshot<Object?> data) {
                    final String name = data.get('name');
                    final image = data['imageUrl'];
                    final String descriptor = data.get('description');

                    return InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 75,
                              width: 75,
                              child: Image.network(image),
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                "${name.padRight(10)} ",
                              ),
                              Text(
                                "$descriptor ",
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  })
                ],
              );
            }
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(child: Text("search anything"));
  }
}
