import 'package:flutter/material.dart';
import 'package:multiple_provider/provider/slider_provider.dart';
import 'package:provider/provider.dart';

class SliderExample extends StatefulWidget {
  const SliderExample({super.key});

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  @override
  Widget build(BuildContext context) {
    print("build");
    final provider = Provider.of<SliderProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Slider Example"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<SliderProvider>(builder: (context, value, child) {
            return Slider(
                value: value.value,
                onChanged: (val) {
                  value.setValue(val);
                });
          }),
          Consumer(builder: (context, value, child) {
            return Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.green.withOpacity(provider.value)),
                    child: Text("Container 1"),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.red.withOpacity(provider.value)),
                    child: Text("Container 2"),
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
