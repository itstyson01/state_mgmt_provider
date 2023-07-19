import 'package:flutter/material.dart';
import 'package:multiple_provider/provider/count_provider.dart';
import 'package:provider/provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {
  @override
  Widget build(BuildContext context) {
    final countprovider = Provider.of<CountProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("Count Example"),
        backgroundColor: Colors.blue,
      ),
      body: Center(child: Consumer<CountProvider>(
        builder: (context, value, child) {
          return Text(
            value.count.toString(),
            style: TextStyle(
              fontSize: 40,
            ),
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countprovider.setCount();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
