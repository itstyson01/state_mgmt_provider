import 'package:flutter/material.dart';
import 'package:multiple_provider/provider/favourite_provider.dart';
import 'package:multiple_provider/screens/favourite/myfavourite.dart';
import 'package:provider/provider.dart';

class FavouriteExample extends StatefulWidget {
  const FavouriteExample({super.key});

  @override
  State<FavouriteExample> createState() => _FavouriteExampleState();
}

class _FavouriteExampleState extends State<FavouriteExample> {
  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite Example"),
        backgroundColor: Colors.blue,
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
                  itemCount: 100,
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
