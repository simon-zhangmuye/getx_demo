import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_demo/controllers/count_controller.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final CountController countController = Get.put(CountController());
  final storage = GetStorage();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('First Screen'),
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
              child: Text('go to second page'),
              onPressed: () {
                Get.toNamed('second');
              },
            ),
            RaisedButton(
              child: Text('show snackbar'),
              onPressed: () {
                Get.snackbar('snackbar title', 'this is a snackbar message',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.blue,
                    colorText: Colors.black54,
                    borderRadius: 50,
                    margin: EdgeInsets.all(10),
                    icon: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.all(20),
                    mainButton: TextButton(
                        child: Text(
                          'cancel',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {}));
              },
            ),
            RaisedButton(
              child: Text('show dialog'),
              onPressed: () {
                Get.defaultDialog(
                  title: 'Are you sure?',
                  content: Text('you want to delete this item?'),
                  backgroundColor: Colors.yellowAccent,
                  textCancel: 'no',
                  textConfirm: 'yes',
                  confirmTextColor: Colors.white,
                  barrierDismissible: true,
                  onCancel: () {},
                  onConfirm: () {},
                );
              },
            ),
            RaisedButton(
              child: Text('go to second page'),
              onPressed: () {
                Get.bottomSheet(Container(
                  color: Colors.yellowAccent,
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      Icon(
                        Icons.message,
                        color: Colors.blueGrey,
                      )
                    ],
                  ),
                ));
              },
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(hintText: 'Email address'),
            ),
            RaisedButton(
                child: Text('submit'),
                onPressed: () {
                  if (GetUtils.isEmail(emailController.text)) {
                    storage.write('email', emailController.text);
                    emailController.text = '';
                  } else {
                    Get.snackbar('wrong', 'wrong');
                  }
                }),
            RaisedButton(
                child: Text('view'),
                onPressed: () {
                  setState(() {
                    emailController.text = storage.read('email');
                  });
                }),
          ],
        ),
      ),
    );
  }
}
