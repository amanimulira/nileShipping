import 'package:flutter/material.dart';
import 'package:nile_shipping/pages/product_search_page.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
          width: double.infinity,
          height: 40,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              color: Colors.white38,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: TextButton(
                onPressed: () {
                  showSearch(context: context, delegate: ProductSearchPage());
                },
                child: Row(
                  children: const [
                    Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                      child: Text(
                        "Search",
                        style: TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                    )
                  ],
                )),
          ))
    ]);
  }
}
