import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/favourite_provider.dart';

class MyFavouriteItemScreen extends StatefulWidget {
  const MyFavouriteItemScreen({super.key});

  @override
  State<MyFavouriteItemScreen> createState() => _MyFavouriteItemScreenState();
}

class _MyFavouriteItemScreenState extends State<MyFavouriteItemScreen> {
  @override
  Widget build(BuildContext context) {
    final favoutiteprovider = Provider.of<FavouriteProvider>(context);
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text("My Favourite"),
        backgroundColor: Colors.red,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyFavouriteItemScreen()));
            },
            child: Icon(Icons.favorite),
          ),
          SizedBox(
            width: 30,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: favoutiteprovider.selecteditem.length,
                  itemBuilder: (context, index) {
                    return Consumer<FavouriteProvider>(
                        builder: (context, value, child) {
                      return ListTile(
                          onTap: () {
                            if (value.selecteditem.contains(index)) {
                              value.removeItems(index);
                            } else {
                              value.addItems(index);
                            }
                          },
                          title: Text("Item" + index.toString()),
                          trailing: Icon(value.selecteditem.contains(index)
                              ? Icons.favorite
                              : Icons.favorite_outline_rounded));
                    });
                  }))
        ],
      ),
    );
  }
}
