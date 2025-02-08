import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Namer App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      ),
      home: MyHomePage(),
    );
  }
}

class MyAppController extends GetxController {
  var current = WordPair.random().obs;

  void newword(){
    current.value=WordPair.random();
  }
}

class MyHomePage extends StatelessWidget {
  final MyAppController controller = Get.put(MyAppController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('A random word:'),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 3,
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Obx(() => Text(controller.current.value.asLowerCase)),
              ),
            ),
            ElevatedButton(
              onPressed: controller.newword,
              child: Text("Generate another word"),
            )
          ],
        ),
      ),
    );
  }
}
