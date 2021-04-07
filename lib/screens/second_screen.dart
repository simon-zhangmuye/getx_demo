import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controllers/count_controller.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final CountController countController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Second Screen'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          countController.increment();
        },
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GetBuilder(
                init: CountController(),
                builder: (value) {
                  return Text('getbuilder: ${value.counter}');
                }),
            GetX<CountController>(
              builder: (val) => Text('getx: ${val.counter.value}'),
            ),
            RaisedButton(
              child: Text('go back to first page'),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
